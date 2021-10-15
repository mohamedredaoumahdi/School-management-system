import 'package:flutter/material.dart';
import 'package:school_management_system_01/dashboardResponsible/manage_parents/gridmanageparents.dart';
class ManageParentsPage extends StatefulWidget {
  @override
  _ManageParentsPageState createState() => _ManageParentsPageState();
}

class _ManageParentsPageState extends State<ManageParentsPage> {
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
                title: new Text("MANAGE PARENT",
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(color: Colors.blue.shade900, fontSize: 18)),
                leading: new IconButton(
                  icon: new Icon(Icons.arrow_back_ios,
                      color: Colors.blue.shade900),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
              ),
            ),
          ),
          SizedBox(
            height: 45,
          ),
          GridManageParents()
        ],
      ),
    );
  }
}