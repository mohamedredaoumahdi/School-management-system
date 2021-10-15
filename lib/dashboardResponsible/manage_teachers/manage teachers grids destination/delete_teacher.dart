import 'package:flutter/material.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/data/teachers.dart';

class DeleteTeacherPage extends StatefulWidget {
  @override
  _DeleteTeacherPageState createState() => _DeleteTeacherPageState();
}

class _DeleteTeacherPageState extends State<DeleteTeacherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
              child: new Positioned(
                top: 0.0,
                left: 0.0,
                right: 0.0,
                child: AppBar(
                  title: new Text(" DELETE TEACHER ",
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
            Container(
              padding: EdgeInsets.symmetric(vertical: 80.0, horizontal: 30.0),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.account_circle),
                        hintText: 'What is the Teacher id?',
                        labelText: 'Id Teacher',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.account_circle),
                        hintText: 'Authentication PassWord',
                        labelText: 'Authentication PassWord',
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      onPressed: clearallTeacherstable,
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 15.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          primary: Colors.blue.shade900),
                      child: Text(
                        "DELETE",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
