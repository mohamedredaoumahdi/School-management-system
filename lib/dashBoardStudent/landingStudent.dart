import 'package:flutter/material.dart';
import 'package:school_management_system_01/backEnd/services/auth.dart';
import 'package:school_management_system_01/dashBoardStudent/student_dashboard.dart';
import 'package:school_management_system_01/loginsformat/login_as_student.dart';

class LandingStudentPage extends StatelessWidget {
  LandingStudentPage({required this.auth});
  final AuthBase auth;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserClient>(
        stream: auth.onAuthStateChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active){
            UserClient user = snapshot.data as UserClient;
            if (user == null as UserClient) {
              return LoginAsStudent(
                auth: auth,
              );
            }
            return StudentDashBoard(
              auth: auth,
            );
          }
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        });
  }
}
