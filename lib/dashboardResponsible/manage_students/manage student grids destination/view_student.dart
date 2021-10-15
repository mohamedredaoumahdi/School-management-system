import 'package:flutter/material.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/page/editableviewteacher/editable_page_viewStudentsPage.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ViewStudentPage extends StatefulWidget {
  @override
  _ViewStudentPageState createState() => _ViewStudentPageState();
}

class _ViewStudentPageState extends State<ViewStudentPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(" Teachers Table ",
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.blue.shade900, fontSize: 18)),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.blue.shade900),
          onPressed: () => Navigator.of(context).pop(),
        ),
        leadingWidth: 100,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
        child: EditablePageViewStudents()
      ),
    );
  }

  
}



class Student {
  Student({required this.firstname, required this.lastname, required this.age, required this.level,
      required this.nbrClasses});
  final String firstname;
  final String lastname;
  final int age;
  final String level;
  final int nbrClasses;

  Student copy({
    String? firstName,
    String? lastName,
    int? age,
    String? level,
    int? nbrClasses
  }) =>
      Student(
        firstname: firstName ?? this.firstname,
        lastname: lastName ?? this.lastname,
        age: age ?? this.age,
        level: level ?? this.level,
        nbrClasses: nbrClasses ?? this.nbrClasses,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Student &&
          runtimeType == other.runtimeType &&
          firstname == other.firstname &&
          lastname == other.lastname &&
          age == other.age &&
          level == other.level &&
          nbrClasses == other.nbrClasses;

  @override
  int get hashCode => firstname.hashCode ^ lastname.hashCode ^ age.hashCode ^ level.hashCode ^ nbrClasses.hashCode;
}
