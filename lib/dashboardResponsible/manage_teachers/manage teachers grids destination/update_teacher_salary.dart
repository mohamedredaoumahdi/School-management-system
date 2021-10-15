import 'package:flutter/material.dart';

class UpdateTeacherSalaryPage extends StatefulWidget {
  @override
  _UpdateTeacherSalaryPageState createState() => _UpdateTeacherSalaryPageState();
}

class _UpdateTeacherSalaryPageState extends State<UpdateTeacherSalaryPage> {

  bool valuefirst = false;
  bool valuesecond = false;
  DateTime dateTime = DateTime.now();
  bool visibility = false;
  bool visibilityObs = false;
  void _changed() {
    setState(() {
      visibility = !visibility;
    });
  }

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
                  title: new Text(" UPDATE TEACHER SALARY ",
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
            visibility
            ?Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 50.0),
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //SizedBox(height: 25.0),
                          TextField(
                            enabled: false,
                            readOnly: true,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.account_circle),
                              hintText: 'the teacher full name?',
                              labelText: 'The full name of teacher',
                            ),
                          ),
                          SizedBox(height: 10.0),
                          
                          TextFormField(
                            decoration: const InputDecoration(
                              icon: Icon(Icons.account_circle),
                              hintText: 'Enter the new salary',
                              labelText: 'the teacher salary',
                            ),
                          ),
                          SizedBox(height: 15.0),
                          
                          SizedBox(height: 15.0),
                          ElevatedButton(
                            onPressed: () => _changed(),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40.0, vertical: 15.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                primary: Colors.blue.shade900),
                            child: Text(
                              "DONE",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
            :
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
                      onPressed: () => _changed(),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 15.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          primary: Colors.blue.shade900),
                      child: Text(
                        "UPDATE",
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