import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/data/users.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/model/user.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/widget/scrollable_widget.dart';
import 'package:school_management_system_01/widgetHelp/UserTable/widget/text_dialog_widget.dart';

import '../utils.dart';

class EditablePage extends StatefulWidget {
  @override
  _EditablePageState createState() => _EditablePageState();
}

class _EditablePageState extends State<EditablePage> {
  late List<User> users;

  @override
  void initState() {
    super.initState();

    this.users = List.of(allUsers);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ScrollableWidget(child: buildDataTable()),
      );

  Widget buildDataTable() {
    final columns = ['First Name', 'Last Name', 'first Exam', 'secand Exam'];

    return DataTable(
      columns: getColumns(columns),
      rows: getRows(users),
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

  List<DataRow> getRows(List<User> users) => users.map((User user) {
        final cells = [user.firstName, user.lastName, user.firstExam, user.secondExam];

        return DataRow(
          cells: Utils.modelBuilder(cells, (index, cell) {
            final showEditIcon = index == 2 || index == 3;

            return DataCell(
              Text('$cell'),
              showEditIcon: showEditIcon,
              onTap: () {
                switch (index) {
                  case 2:
                    editFirstExam(user);
                    break;
                  case 3:
                    editLastExam(user);
                    break;
                }
              },
            );
          }),
        );
      }).toList();

  Future editFirstExam(User editUser) async {
    final firstExam = await showTextDialog(
      context,
      title: 'Change First Exam Note',
      value: editUser.firstExam.toString(),
    );

    setState(() => users = users.map((user) {
          final isEditedUser = user == editUser;

          return isEditedUser ? user.copy(firstExam: int.parse(firstExam)) : user;
        }).toList());
  }

  Future editLastExam(User editUser) async {
    final lastExam = await showTextDialog(
      context,
      title: 'Change Last Exam Note',
      value: editUser.secondExam.toString(),
    );

    setState(() => users = users.map((user) {
          final isEditedUser = user == editUser;

          return isEditedUser ? user.copy(secondExam: int.tryParse(lastExam)) : user;
        }).toList());
  }
}