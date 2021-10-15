import 'package:flutter/material.dart';

class UpdateClassPage extends StatefulWidget {
  @override
  _UpdateClassPageState createState() => _UpdateClassPageState();
}

class _UpdateClassPageState extends State<UpdateClassPage> {
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

  void _changedObs() {
    setState(() {
      visibilityObs = !visibilityObs;
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
                  title: new Text(" UPDATE A PARENT ",
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
                ? Container(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 50.0),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //SizedBox(height: 25.0),
                    SizedBox(height: 60.0),

                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.account_circle),
                        hintText: 'What is the class level?',
                        labelText: 'The level of the class',
                      ),
                    ),
                    SizedBox(height: 25.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.account_circle),
                        hintText:
                            'What is the subject that the classroom teach ?',
                        labelText: 'The subject that the classroom teach',
                      ),
                    ),
                    SizedBox(height: 25.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.account_circle),
                        hintText: 'What is the classroom capacity ?',
                        labelText: 'The classroom capacity',
                      ),
                    ),
                    SizedBox(height: 25.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.account_circle),
                        hintText:
                            'What are the teachers working with this class ?',
                        labelText: 'The teachers working with this class',
                      ),
                    ),
                    SizedBox(height: 25.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.account_circle),
                        hintText:
                            'What are the students studying in this class ?',
                        labelText: 'The he students studying in this class ',
                      ),
                    ),
                    SizedBox(height: 25.0),

                    SizedBox(height: 60.0),
                    ElevatedButton(
                      onPressed: () => _changed(),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 15.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          primary: Colors.blue.shade900),
                      child: Text(
                        "ADD",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            )
                : Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 80.0, horizontal: 30.0),
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            decoration: const InputDecoration(
                              icon: Icon(Icons.account_circle),
                              hintText: 'What is the Class id?',
                              labelText: 'Id Class',
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
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