import 'package:flutter/material.dart';
import 'package:school_management_system_01/dashboardResponsible/manage_teachers/manage%20teachers%20grids%20destination/view_teachers.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/data/teachers.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/widget/scrollable_widget.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/widget/text_dialog_widget.dart';

import '../../utils.dart';

class EditablePageViewTeacher extends StatefulWidget {
  @override
  _EditablePageViewTeacherState createState() => _EditablePageViewTeacherState();
}

class _EditablePageViewTeacherState extends State<EditablePageViewTeacher> {
  late List<Teacher> teachers;

  @override
  void initState() {
    super.initState();

    this.teachers = List.of(allTeachers);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ScrollableWidget(child: buildDataTable()),
      );

  Widget buildDataTable() {
    final columns = ['First Name', 'Last Name', 'Salary', 'Subject', 'nombre of classes'];

    return DataTable(
      columns: getColumns(columns),
      rows: getRows(teachers),
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

  List<DataRow> getRows(List<Teacher> teachers) => teachers.map((Teacher teacher) {
        final cells = [teacher.firstname, teacher.lastname, teacher.salary, teacher.subject,teacher.nbrClasses];

        return DataRow(
          cells: Utils.modelBuilder(cells, (index, cell) {
            final showEditIcon = index == 0 || index == 1 || index == 2 || index == 3  || index == 4 ;

            return DataCell(
              Text('$cell'),
              showEditIcon: showEditIcon,
              onTap: () {
                switch (index) {
                  case 0:
                    editFirstName(teacher);
                    break;
                  case 1:
                    editLastName(teacher);
                    break;
                  case 2:
                    editSalary(teacher);
                    break;
                  case 3:
                    editSubject(teacher);
                    break;
                    case 4:
                    editNbrClasses(teacher);
                    break;
                }
              },
            );
          }),
        );
      }).toList();

  Future editFirstName(Teacher editteacher) async {
    final firstName = await showTextDialog(
      context,
      title: 'Change First Name',
      value: editteacher.firstname.toString(),
    );

    setState(() => teachers = teachers.map((teacher) {
          final isEditedTeacher = teacher == editteacher;

          return isEditedTeacher ? teacher.copy(firstName: firstName) : teacher;
        }).toList());
  }

  Future editLastName(Teacher editteacher) async {
    final lastName = await showTextDialog(
      context,
      title: 'Change Last Name',
      value: editteacher.lastname.toString(),
    );

    setState(() => teachers = teachers.map((teacher) {
          final isEditedTeacher = teacher == editteacher;

          return isEditedTeacher ? teacher.copy(lastName: lastName) : teacher;
        }).toList());
  }

  Future editSalary(Teacher editteacher) async {
    final salary = await showTextDialog(
      context,
      title: 'Change salary',
      value: editteacher.salary.toString(),
    );

    setState(() => teachers = teachers.map((teacher) {
          final isEditedTeacher = teacher == editteacher;

          return isEditedTeacher ? teacher.copy(salary: int.tryParse(salary)) : teacher;
        }).toList());
  }

  Future editSubject(Teacher editteacher) async {
    final subject = await showTextDialog(
      context,
      title: 'Change Subject',
      value: editteacher.subject.toString(),
    );

    setState(() => teachers = teachers.map((teacher) {
          final isEditedTeacher = teacher == editteacher;

          return isEditedTeacher ? teacher.copy(subject: subject) : teacher;
        }).toList());
  }

  Future editNbrClasses(Teacher editteacher) async {
    final nbrClasses = await showTextDialog(
      context,
      title: 'Change nombre of classes',
      value: editteacher.salary.toString(),
    );

    setState(() => teachers = teachers.map((teacher) {
          final isEditedTeacher = teacher == editteacher;

          return isEditedTeacher ? teacher.copy(nbrClasses: int.tryParse(nbrClasses)) : teacher;
        }).toList());
  }

}