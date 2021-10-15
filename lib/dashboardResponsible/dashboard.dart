import 'package:flutter/material.dart';
import 'package:school_management_system_01/backEnd/services/auth.dart';
import 'package:school_management_system_01/loginsformat/platFormAlertDialog.dart';
import 'griddashboard.dart';

class DashboardResponsible extends StatelessWidget {
  DashboardResponsible({required this.auth});
  final AuthBase auth;

  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await PlatformAlertDialog(
            title: 'Log Out',
            content: "Are you sure that you want to log out ?",
            cancelActionText: 'Cancel',
            defaultActionText: 'LogOut')
        .show(context);
    if (didRequestSignOut == true) {
      _signOut();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: new Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: AppBar(
                title: new Text("DASHBOARD",
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(color: Colors.blue.shade900, fontSize: 18)),
                backgroundColor: Colors.white,
                elevation: 0.0,
                actions: [
                  TextButton(
                      onPressed: () => _confirmSignOut(context),
                      child: Text('Log Out',
                          style: TextStyle(
                              color: Colors.blue.shade900, fontSize: 14)))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          GridDashboard()
        ],
      ),
    );
  }
}
