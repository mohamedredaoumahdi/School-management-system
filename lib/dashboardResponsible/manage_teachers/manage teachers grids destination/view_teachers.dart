import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/page/editableviewteacher/editable_page_viewTeachersPage.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ViewTeachersPage extends StatefulWidget {
  @override
  _ViewTeachersPageState createState() => _ViewTeachersPageState();
}

class _ViewTeachersPageState extends State<ViewTeachersPage> {

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
        child: EditablePageViewTeacher()
      ),
    );
  }

  
}



class Teacher {
  const Teacher({required this.firstname,required this.lastname,required this.salary,required this.subject,
      required this.nbrClasses});
  final String firstname;
  final String lastname;
  final int salary;
  final String subject;
  final int nbrClasses;

  Teacher copy({
    String? firstName,
    String? lastName,
    int? salary,
    String? subject,
    int? nbrClasses
  }) =>
      Teacher(
        firstname: firstName ?? this.firstname,
        lastname: lastName ?? this.lastname,
        salary: salary ?? this.salary,
        subject: subject ?? this.subject,
        nbrClasses: nbrClasses ?? this.nbrClasses,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Teacher &&
          runtimeType == other.runtimeType &&
          firstname == other.firstname &&
          lastname == other.lastname &&
          salary == other.salary &&
          subject == other.subject &&
          nbrClasses == other.nbrClasses;

  @override
  int get hashCode => firstname.hashCode ^ lastname.hashCode ^ salary.hashCode ^ subject.hashCode ^ nbrClasses.hashCode;
}
