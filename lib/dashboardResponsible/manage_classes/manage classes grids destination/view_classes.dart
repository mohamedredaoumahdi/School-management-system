import 'package:flutter/material.dart';
import 'package:school_management_system_01/dashboardResponsible/manage_classes/manage%20classes%20grids%20destination/viewClassesDetail.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/page/editableviewteacher/editable_page_viewClassesPage.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ViewClassesPage extends StatefulWidget {
  @override
  _ViewClassesPageState createState() => _ViewClassesPageState();
}

class _ViewClassesPageState extends State<ViewClassesPage> {
  

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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        child: Column(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
            child: new Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: AppBar(
                title: new Text(" VIEW CLASSES ",
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
          ElevatedButton(
                  onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ViewClassesDetailPage()),
                          );
                        },
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
          
        ]),
      ),
    );
  }

  
}


class Class {
  Class({required this.classname, required this.nbrStudents, required this.nbrTeachers});
  final String classname;
  final int nbrStudents;
  final int nbrTeachers;

  Class copy({
    String? classname,
    int? nbrStudents,
    int? nbrTeachers,
  }) =>
      Class(
        classname : classname ?? this.classname,
        nbrStudents: nbrStudents ?? this.nbrStudents,
        nbrTeachers: nbrTeachers ?? this.nbrTeachers,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Class &&
          runtimeType == other.runtimeType &&
          classname == other.classname &&
          nbrStudents == other.nbrStudents &&
          nbrTeachers == other.nbrTeachers;

  @override
  int get hashCode => classname.hashCode ^ nbrStudents.hashCode ^ nbrTeachers.hashCode ;
}
