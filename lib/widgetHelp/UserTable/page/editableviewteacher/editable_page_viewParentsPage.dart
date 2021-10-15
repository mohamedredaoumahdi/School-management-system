import 'package:flutter/material.dart';
import 'package:school_management_system_01/dashboardResponsible/manage_parents/manage%20parents%20grids%20destination/view_parents.dart';
import 'package:school_management_system_01/dashboardResponsible/manage_students/manage%20student%20grids%20destination/view_student.dart';
import 'package:school_management_system_01/dashboardResponsible/manage_teachers/manage%20teachers%20grids%20destination/view_teachers.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/data/parents.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/data/students.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/data/teachers.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/widget/scrollable_widget.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/widget/text_dialog_widget.dart';

import '../../utils.dart';

class EditablePageViewParent extends StatefulWidget {
  @override
  _EditablePageViewParentState createState() => _EditablePageViewParentState();
}

class _EditablePageViewParentState extends State<EditablePageViewParent> {
  late List<Parent> parents;

  @override
  void initState() {
    super.initState();

    this.parents = List.of(allParents);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ScrollableWidget(child: buildDataTable()),
      );

  Widget buildDataTable() {
    final columns = ['First Name', 'Last Name', 'Adress', 'nombre of kids'];

    return DataTable(
      columns: getColumns(columns),
      rows: getRows(parents),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      final isAge = column == columns[2];

      return DataColumn(
        label: Text(column),
        numeric: isAge,
      );
    }).toList();
  }

  List<DataRow> getRows(List<Parent> parents) => parents.map((Parent parent) {
        final cells = [parent.firstname, parent.lastname, parent.adress,parent.nbrKids];

        return DataRow(
          cells: Utils.modelBuilder(cells, (index, cell) {
            final showEditIcon = index == 0 || index == 1 || index == 2 || index == 3 ;

            return DataCell(
              Text('$cell'),
              showEditIcon: showEditIcon,
              onTap: () {
                switch (index) {
                  case 0:
                    editFirstName(parent);
                    break;
                  case 1:
                    editLastName(parent);
                    break;
                  case 2:
                    editAdress(parent);
                    break;
                    case 3:
                    editNbrKids(parent);
                    break;
                }
              },
            );
          }),
        );
      }).toList();

  Future editFirstName(Parent editstudent) async {
    final firstName = await showTextDialog(
      context,
      title: 'Change First Name',
      value: editstudent.firstname.toString(),
    );

    setState(() => parents = parents.map((parent) {
          final isEditedStudent = parent == editstudent;

          return isEditedStudent ? parent.copy(firstName: firstName) : parent;
        }).toList());
  }

  Future editLastName(Parent editLastName) async {
    final lastName = await showTextDialog(
      context,
      title: 'Change Last Name',
      value: editLastName.lastname.toString(),
    );

    setState(() => parents = parents.map((parent) {
          final isEditedStudent = parent == editLastName;

          return isEditedStudent ? parent.copy(lastName: lastName) : parent;
        }).toList());
  }

  

  Future editAdress(Parent editparent) async {
    final adress = await showTextDialog(
      context,
      title: 'Change adress',
      value: editparent.adress.toString(),
    );

    setState(() => parents = parents.map((parent) {
          final isEditedParent = parent == editparent;

          return isEditedParent ? parent.copy(adress: adress) : parent;
        }).toList());
  }

  Future editNbrKids(Parent editparent) async {
    final nbrKids = await showTextDialog(
      context,
      title: 'Change nombre of kids',
      value: editparent.nbrKids.toString(),
    );

    setState(() => parents = parents.map((parent) {
          final isEditedParent = parent == editparent;

          return isEditedParent ? parent.copy(nbrKids: int.tryParse(nbrKids)) : parent;
        }).toList());
  }

}