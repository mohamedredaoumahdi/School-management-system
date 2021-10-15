import 'package:flutter/material.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/page/editabme_page_notes_student.dart';

class StudentNotesTable extends StatefulWidget {
  @override
  _StudentNotesTableState createState() => _StudentNotesTableState();
}

class _StudentNotesTableState extends State<StudentNotesTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(" Notes Table ",
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
        child: EditablePageNotesStudent()
      ),
    );
  }
}