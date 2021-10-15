import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class AddStudentPage extends StatefulWidget {
  @override
  _AddStudentPageState createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  bool valuefirst = false;
  bool valuesecond = false;
  DateTime dateTime = DateTime.now();
  bool visibilityObs = false ;
  //String dateTimePicked;
  void _changed() {
    setState(() {
      visibilityObs = !visibilityObs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              child: new Positioned(
                top: 0.0,
                left: 0.0,
                right: 0.0,
                child: AppBar(
                  title: new Text(" ADD STUDENT ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.blue.shade900, fontSize: 18)),
                  leading: new IconButton(
                    icon: new Icon(Icons.arrow_back_ios, color: Colors.blue.shade900),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                ),
              ),
            ),
            //SizedBox(height: 100.0),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 50.0),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    //SizedBox(height: 25.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.account_circle),
                        hintText: 'What is the student full name?',
                        labelText: 'The full name of student',
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.account_circle),
                        hintText: 'What is the father full name?',
                        labelText: 'The full name of the father',
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.account_circle),
                        hintText: 'What is the CNIC father ?',
                        labelText: 'The CNIC of the father',
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Gender',
                          style: TextStyle(fontSize: 17.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Checkbox(
                              value: this.valuefirst,
                              onChanged: (value) {
                                setState(() {
                                  this.valuefirst = value!;
                                  this.valuesecond = false;
                                });
                              },
                            ),
                            Checkbox(
                              value: this.valuesecond,
                              onChanged: (value) {
                                setState(() {
                                  this.valuesecond = value!;
                                  this.valuefirst = false;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0),
                    visibilityObs
                        ? Column(
                            children: <Widget>[
                              Positioned(
                                child: new ElevatedButton(
                                  onPressed: () => _changed(),
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 5.0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      primary: Colors.blue.shade900),
                                  child: Text(
                                    "Done",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ),
                              new SizedBox(
                                width: 500,
                                height: 180,
                                child: CupertinoDatePicker(
                                  minimumYear: 2004,
                                  maximumYear: DateTime.now().year,
                                  initialDateTime: dateTime,
                                  mode: CupertinoDatePickerMode.date,
                                  onDateTimeChanged: (dateTime) =>
                                      setState(() => this.dateTime = dateTime),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            //mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () => _changed(),
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 0.0, vertical: 10.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    primary: Colors.blue.shade900),
                                child: Icon(
                                  Icons.calendar_today_sharp,
                                  color: Colors.white,
                                  //style: TextStyle(
                                  //    color: Colors.white, fontSize: 14),
                                ),
                              ),
                              SizedBox(width: 150,),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 20.0,
                                      right: 0.0    
                                  ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      //icon: Icon(Icons.calendar_today_sharp),
                                      hintText: _dateTimePicked(),
                                    ),
                                    readOnly: true,
                                  ),
                                ),
                              ),
                              
                            ],
                          ),
                    SizedBox(height: 15.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.account_circle),
                        hintText: 'What is the CNIC of the student ?',
                        labelText: 'The CNIC of the student',
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.account_circle),
                        hintText: 'What is the phone number of the father ?',
                        labelText: 'The phone number of the father',
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.account_circle),
                        hintText: 'What is the email of the father ?',
                        labelText: 'The email of the father',
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.account_circle),
                        hintText: 'What is the home adress ?',
                        labelText: 'The home adress ',
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.account_circle),
                        hintText: 'What is Student Age ?',
                        labelText: 'The Student Age ',
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.account_circle),
                        hintText: 'What is the number of the classes taken ?',
                        labelText: 'The classes taken ',
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.account_circle),
                        hintText: 'What is Admission class ?',
                        labelText: 'The Admission class ',
                      ),
                    ),
                    SizedBox(height: 60.0),
                    ElevatedButton(
                      onPressed: ()  => {},
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
            ),
          ],
        ),
      ),
    );
  }

  String _dateTimePicked() {
    String dateTimePicked = DateFormat('yyyy-MM-dd').format(dateTime);
    return dateTimePicked;
  }
}
