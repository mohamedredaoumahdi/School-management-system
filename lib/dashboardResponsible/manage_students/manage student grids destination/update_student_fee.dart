import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school_management_system_01/widgetHelp/priceForm.dart';

class UpdateStudentFeePage extends StatefulWidget {
  @override
  _UpdateStudentFeePageState createState() => _UpdateStudentFeePageState();
}

class _UpdateStudentFeePageState extends State<UpdateStudentFeePage> {
  final children = <PriceForm>[];
  bool valuefirst = false;
  bool valuesecond = false;
  DateTime dateTime = DateTime.now();
  bool visibility = false;
  bool visibilityObs = false;
  int nbrpriceform = 0;
  int oldnbrpriceform = 0;
  List<Widget> priseForm(){
    List<Widget> list = [];
    for (var i = 0; i < nbrpriceform; i++) {
      list.add(new PriceForm());
      list.add(new SizedBox(height: 20,));
    }
    return list;

  }
  Widget getElementWidget(index) {
    List<Widget> list = [];
    list.add(new PriceForm());
    return list.elementAt(index);
  }

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
                  title: new Text(" UPDATE PARENT FEES",
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
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 50.0),
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //SizedBox(height: 25.0),
                          TextField(
                            enabled: false,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.escalator_warning_outlined),
                              hintText: 'What is the parent full name?',
                              labelText: 'The full name of the parent',
                            ),
                          ),
                          SizedBox(height: 10.0),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 20),
                            child: Column(
                              children: [
                                //getElementWidget(nbrpriceform),
                                if(oldnbrpriceform < nbrpriceform) Column(children:priseForm()),
                                SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          oldnbrpriceform = nbrpriceform;
                                          nbrpriceform++;
                                          print(nbrpriceform);
                                        });
                                      },
                                      child: Icon(Icons.add),
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                            CircleBorder()),
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.all(12)),
                                        backgroundColor:
                                            MaterialStateProperty.all(Colors
                                                .blue
                                                .shade300), // <-- Button color
                                        overlayColor: MaterialStateProperty
                                            .resolveWith<Color?>((states) {
                                          if (states
                                              .contains(MaterialState.pressed))
                                            return Colors
                                                .blue; // <-- Splash color
                                        }),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Total"),
                                      Text("20000"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 0,
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
                              "DONE",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
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
                              hintText: 'What is the Parent id?',
                              labelText: 'Id parent',
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
                            height: 20,
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
