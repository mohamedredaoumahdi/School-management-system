import 'package:flutter/material.dart';

class StudentHomeWorks extends StatefulWidget {
  @override
  _StudentHomeWorksState createState() => _StudentHomeWorksState();
}

class _StudentHomeWorksState extends State<StudentHomeWorks> {
  List<Widget> adds = [];

  late List<TpsList> coureses = [
    TpsList(
        id: 1,
        classname: '998hhhhhh8 3344',
        subject: "mmm",
        datePosted: "33",
        tpPosted: "tp1"),
    TpsList(
        id: 1,
        classname: '998ssss8 3344',
        subject: "mmm",
        datePosted: "33",
        tpPosted: "tp2"),
    TpsList(
        id: 1,
        classname: '998ffff8 3344',
        subject: "mmm",
        datePosted: "33",
        tpPosted:
            "tp3"),
    TpsList(
        id: 1,
        classname: '9988 3344',
        subject: "mmm",
        datePosted: "33",
        tpPosted: "tp4"),
  ];
  var store, store1;
  int _selectedValue = 1;
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

  String _selectedValue2 = 'maths';
  List<String> listofValue2 = ["maths", "frensh", "english"];
  ScrollController _scrollController = ScrollController();

  scrollToBottom() async {
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) => _scrollController.jumpTo(
        _scrollController.position.maxScrollExtent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Tps List",
            style: TextStyle(color: Colors.grey.shade50),
          ),
          brightness: Brightness.dark,
          backgroundColor: Colors.indigo.shade600,
          centerTitle: true,
        ),
        body: visibility
            ? Container(
                child: ListView(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      flex: 85,
                      child: Container(
                        child: RawScrollbar(
                          thickness: 4,
                          thumbColor: Colors.indigo,
                          radius: Radius.circular(15),
                          child: SingleChildScrollView(
                            controller: _scrollController,
                            child: Column(
                              children: adds,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: coureses
                          .map((e) => Container(
                                //title: Text(e.id.toString()),
                                //subtitle: Text(e.subject),
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 50.0),
                                child: Container(
                                  padding: EdgeInsets.all(30),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF5F6F9),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            _selectedValue2,
                                            style: TextStyle(
                                                color: Colors.blue.shade900,
                                                fontSize: 14),
                                          ),
                                          Text(e.datePosted,
                                              style: TextStyle(
                                                  color: Colors.blue.shade900,
                                                  fontSize: 14)),
                                        ],
                                      ),
                                      SizedBox(height: 30),
                                      Container(
                                          child: Text(e.tpPosted,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18))),
                                      SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              )
            : Column(
                children: <Widget>[
                  SizedBox(
                    height: 45,
                  ),
                  Text("Select the subject"),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100, right: 100),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField(
                        decoration: InputDecoration.collapsed(hintText: ''),
                        value: _selectedValue2,
                        hint: Text(
                          'choose one',
                        ),
                        isExpanded: true,
                        onChanged: (value) {
                          setState(() {
                            _selectedValue2 = value.toString();
                          });
                        },
                        onSaved: (value) {
                          setState(() {
                            _selectedValue2 = value.toString();
                          });
                        },
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return "can't empty";
                          } else {
                            return null;
                          }
                        },
                        items: listofValue2.map((String val) {
                          return DropdownMenuItem(
                            value: val,
                            child: Text(
                              val.toString(),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
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
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ));
  }
}

class TpsList {
  TpsList(
      {required this.id,
      required this.classname,
      required this.subject,
      required this.datePosted,
      required this.tpPosted});
  int id;
  String classname;
  String subject;
  String datePosted;
  String tpPosted;
}
