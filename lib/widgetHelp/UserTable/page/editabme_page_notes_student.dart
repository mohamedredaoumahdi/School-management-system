import 'package:flutter/material.dart';
import 'package:school_management_system_01/dashBoardStudent/grids%20destination/studentNotes.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/data/studentNotesdata.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/data/users.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/model/studentNotes.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/model/user.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/widget/scrollable_widget.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/widget/text_dialog_widget.dart';

import '../utils.dart';


class EditablePageNotesStudent extends StatefulWidget {
  @override
  _EditablePageNotesStudentState createState() => _EditablePageNotesStudentState();
}

class _EditablePageNotesStudentState extends State<EditablePageNotesStudent> {
    late List<StudentNotes> studentNotes;

  @override
  void initState() {
    super.initState();

    this.studentNotes = List.of(allStudentNotes);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ScrollableWidget(child: buildDataTable()),
      );

  Widget buildDataTable() {
    final columns = ['subject', 'first Exam', 'secand Exam'];

    return DataTable(
      columns: getColumns(columns),
      rows: getRows(studentNotes),
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

  List<DataRow> getRows(List<StudentNotes> studentNote) => studentNotes.map((StudentNotes studentNote) {
        final cells = [studentNote.subject, studentNote.firstExam, studentNote.secondExam];

        return DataRow(
          cells: Utils.modelBuilder(cells, (index, cell) {
            //final showEditIcon = index == 2 || index == 3;

            return DataCell(
              Text('$cell'),
              //showEditIcon: showEditIcon,
              onTap: () {}
            );
          }),
        );
      }).toList();

  
}