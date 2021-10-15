import 'package:flutter/material.dart';

class SeeClassTpsPage extends StatefulWidget {
  @override
  _SeeClassTpsPageState createState() => _SeeClassTpsPageState();
}

class _SeeClassTpsPageState extends State<SeeClassTpsPage> {
  int _selectedValue = 1;
  List<int> listOfValue = [1, 2, 3, 4];
  String _selectedValue2 = 'primaire';
  List<String> listofValue2 = ["primaire", "college", "lycée"];
  bool visibility = false;

  void _changed() {
    setState(() {
      visibility = !visibility;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        //padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: new Positioned(
                top: 0.0,
                left: 0.0,
                right: 0.0,
                child: AppBar(
                  title: new Text(" WIEW A CLASS TPS ",
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
              height: 30,
            ),
            Text("Select if it s primaire or college or lycée"),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField(
                  decoration: InputDecoration.collapsed(hintText: ''),
                  value: _selectedValue,
                  hint: Text(
                    'choose one',
                  ),
                  isExpanded: true,
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = int.parse(value.toString());
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _selectedValue = int.parse(value.toString());
                    });
                  },
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "can't empty";
                    } else {
                      return null;
                    }
                  },
                  items: listOfValue.map((int val) {
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
            SizedBox(
              height: 40,
            ),
            Text("Select the level"),
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
            visibility
                ? Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 50.0),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left:40,right:40,top:20,bottom:20),
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
                                    "from",
                                    style: TextStyle(
                                        color: Colors.blue.shade900,
                                        fontSize: 18),
                                  ),
                                  Text("date",
                                      style: TextStyle(
                                          color: Colors.blue.shade900,
                                          fontSize: 18)),
                                ],
                              ),
                              SizedBox(height: 30),
                              Container(
                                  child: Text(
                                      "Tp1")),
                              SizedBox(height: 20),
                              
                            ],
                          ),
                        ),
                        SizedBox(height:30),
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
                    ),
                  )
                : ElevatedButton(
                    onPressed: () => _changed(),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 15.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        primary: Colors.blue.shade900),
                    child: Text(
                      "SHOW",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}