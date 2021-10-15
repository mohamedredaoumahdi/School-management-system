import 'package:flutter/material.dart';
import 'package:school_management_system_01/dashboardResponsible/manage_classes/manage%20classes%20grids%20destination/view_classes.dart';
import 'package:school_management_system_01/dashboardResponsible/manage_parents/manage%20parents%20grids%20destination/view_parents.dart';
import 'package:school_management_system_01/dashboardResponsible/manage_students/manage%20student%20grids%20destination/view_student.dart';
import 'package:school_management_system_01/dashboardResponsible/manage_teachers/manage%20teachers%20grids%20destination/view_teachers.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/data/classes.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/data/parents.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/data/students.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/data/teachers.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/widget/scrollable_widget.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/widget/text_dialog_widget.dart';

import '../../utils.dart';

class EditablePageViewClasses extends StatefulWidget {
  @override
  _EditablePageViewClassesState createState() => _EditablePageViewClassesState();
}

class _EditablePageViewClassesState extends State<EditablePageViewClasses> {
  late List<Class> classes;

  @override
  void initState() {
    super.initState();

    this.classes = List.of(allClasses);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ScrollableWidget(child: buildDataTable()),
      );

  Widget buildDataTable() {
    final columns = ['Class Name', 'numbre of student', 'numbre of teachers',];

    return DataTable(
      columns: getColumns(columns),
      rows: getRows(classes),
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

  List<DataRow> getRows(List<Class> parents) => parents.map((Class parent) {
        final cells = [parent.classname, parent.nbrStudents, parent.nbrTeachers];

        return DataRow(
          cells: Utils.modelBuilder(cells, (index, cell) {
            final showEditIcon = index == 0 || index == 1 || index == 2;

            return DataCell(
              Text('$cell'),
              showEditIcon: showEditIcon,
              onTap: () {
                switch (index) {
                  case 0:
                    editClassName(parent);
                    break;
                  case 1:
                    editNbrStudents(parent);
                    break;
                  case 2:
                    editNbrTeachers(parent);
                    break;
                }
              },
            );
          }),
        );
      }).toList();

  Future editClassName(Class editstudent) async {
    final firstName = await showTextDialog(
      context,
      title: 'Change First Name',
      value: editstudent.classname.toString(),
    );

    setState(() => classes = classes.map((parent) {
          final isEditedStudent = parent == editstudent;

          return isEditedStudent ? parent.copy(classname: firstName) : parent;
        }).toList());
  }

  Future editNbrStudents(Class editLastName) async {
    final lastName = await showTextDialog(
      context,
      title: 'Change Last Name',
      value: editLastName.nbrStudents.toString(),
    );

    setState(() => classes = classes.map((parent) {
          final isEditedStudent = parent == editLastName;

          return isEditedStudent ? parent.copy(nbrStudents: int.tryParse(lastName)) : parent;
        }).toList());
  }

  


  Future editNbrTeachers(Class editparent) async {
    final nbrKids = await showTextDialog(
      context,
      title: 'Change nombre of kids',
      value: editparent.nbrTeachers.toString(),
    );

    setState(() => classes = classes.map((parent) {
          final isEditedParent = parent == editparent;

          return isEditedParent ? parent.copy(nbrTeachers: int.tryParse(nbrKids)) : parent;
        }).toList());
  }

}