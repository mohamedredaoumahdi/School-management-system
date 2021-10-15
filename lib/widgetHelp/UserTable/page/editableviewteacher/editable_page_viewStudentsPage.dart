import 'package:flutter/material.dart';
import 'package:school_management_system_01/dashboardResponsible/manage_students/manage%20student%20grids%20destination/view_student.dart';
import 'package:school_management_system_01/dashboardResponsible/manage_teachers/manage%20teachers%20grids%20destination/view_teachers.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/data/students.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/data/teachers.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/widget/scrollable_widget.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/widget/text_dialog_widget.dart';

import '../../utils.dart';

class EditablePageViewStudents extends StatefulWidget {
  @override
  _EditablePageViewStudentsState createState() => _EditablePageViewStudentsState();
}

class _EditablePageViewStudentsState extends State<EditablePageViewStudents> {
  late List<Student> students;

  @override
  void initState() {
    super.initState();

    this.students = List.of(allStudents);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ScrollableWidget(child: buildDataTable()),
      );

  Widget buildDataTable() {
    final columns = ['First Name', 'Last Name', 'Age', 'level', 'nombre of classes'];

    return DataTable(
      columns: getColumns(columns),
      rows: getRows(students),
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

  List<DataRow> getRows(List<Student> students) => students.map((Student student) {
        final cells = [student.firstname, student.lastname, student.age, student.level,student.nbrClasses];

        return DataRow(
          cells: Utils.modelBuilder(cells, (index, cell) {
            final showEditIcon = index == 0 || index == 1 || index == 2 || index == 3  || index == 4 ;

            return DataCell(
              Text('$cell'),
              showEditIcon: showEditIcon,
              onTap: () {
                switch (index) {
                  case 0:
                    editFirstName(student);
                    break;
                  case 1:
                    editLastName(student);
                    break;
                  case 2:
                    editAge(student);
                    break;
                  case 3:
                    editLevel(student);
                    break;
                    case 4:
                    editNbrClasses(student);
                    break;
                }
              },
            );
          }),
        );
      }).toList();

  Future editFirstName(Student editstudent) async {
    final firstName = await showTextDialog(
      context,
      title: 'Change First Name',
      value: editstudent.firstname.toString(),
    );

    setState(() => students = students.map((student) {
          final isEditedStudent = student == editstudent;

          return isEditedStudent ? student.copy(firstName: firstName) : student;
        }).toList());
  }

  Future editLastName(Student editstudent) async {
    final lastName = await showTextDialog(
      context,
      title: 'Change Last Name',
      value: editstudent.lastname.toString(),
    );

    setState(() => students = students.map((student) {
          final isEditedStudent = student == editstudent;

          return isEditedStudent ? student.copy(lastName: lastName) : student;
        }).toList());
  }

  Future editAge(Student editstudent) async {
    final age = await showTextDialog(
      context,
      title: 'Change salary',
      value: editstudent.age.toString(),
    );

    setState(() => students = students.map((student) {
          final isEditedStudent = student == editstudent;

          return isEditedStudent ? student.copy(age: int.tryParse(age)) : student;
        }).toList());
  }

  Future editLevel(Student editstudent) async {
    final level = await showTextDialog(
      context,
      title: 'Change Subject',
      value: editstudent.level.toString(),
    );

    setState(() => students = students.map((student) {
          final isEditedStudent = student == editstudent;

          return isEditedStudent ? student.copy(level: level) : student;
        }).toList());
  }

  Future editNbrClasses(Student editStudent) async {
    final nbrClasses = await showTextDialog(
      context,
      title: 'Change nombre of classes',
      value: editStudent.nbrClasses.toString(),
    );

    setState(() => students = students.map((student) {
          final isEditedStudent = student == editStudent;

          return isEditedStudent ? student.copy(nbrClasses: int.tryParse(nbrClasses)) : student;
        }).toList());
  }

}