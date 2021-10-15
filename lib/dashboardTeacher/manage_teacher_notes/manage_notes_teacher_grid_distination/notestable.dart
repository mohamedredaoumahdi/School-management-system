import 'package:flutter/material.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/page/editable_page.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/widget/tabbar_widget.dart';

import '../../../widgetHelp/UserTable/page/editable_page.dart';

class NotesTablePage extends StatefulWidget {
  @override
  _NotesTablePageState createState() => _NotesTablePageState();
}

class _NotesTablePageState extends State<NotesTablePage> {
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
        child: EditablePage()
      ),
    );
  }
}
