import 'package:flutter/material.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/page/editableviewteacher/editable_page_viewParentsPage.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ViewParentPage extends StatefulWidget {
  @override
  _ViewParentPageState createState() => _ViewParentPageState();
}

class _ViewParentPageState extends State<ViewParentPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(" Parents Table ",
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
        child: EditablePageViewParent()
      ),
    );
  }

  
}


class Parent {
  Parent({required this.firstname, required this.lastname, required this.adress, required this.nbrKids});
  final String firstname;
  final String lastname;
  final String adress;
  final int nbrKids;


  Parent copy({
    String? firstName,
    String? lastName,
    String? adress,
    int? nbrKids,
  }) =>
      Parent(
        firstname: firstName ?? this.firstname,
        lastname: lastName ?? this.lastname,
        adress: adress ?? this.adress,
        nbrKids: nbrKids ?? this.nbrKids,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Parent &&
          runtimeType == other.runtimeType &&
          firstname == other.firstname &&
          lastname == other.lastname &&
          adress == other.adress &&
          nbrKids == other.nbrKids;

  @override
  int get hashCode => firstname.hashCode ^ lastname.hashCode ^ adress.hashCode ^ nbrKids.hashCode;
}
