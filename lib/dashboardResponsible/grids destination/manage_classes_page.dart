import 'package:flutter/material.dart';
import 'package:school_management_system_01/dashboardResponsible/manage_classes/gridmanageclasses.dart';
class ManageClassesPage extends StatefulWidget {
  @override
  _ManageClassesPageState createState() => _ManageClassesPageState();
}

class _ManageClassesPageState extends State<ManageClassesPage> {
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
                title: new Text("MANAGE CLASSES",
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
            height: 28,
          ),
          GridManageClasses()
        ],
      ),
    );
  }
}