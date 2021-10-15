import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:school_management_system_01/backEnd/services/auth.dart';
import 'package:school_management_system_01/dashboardResponsible/landingresponsible.dart';
import 'package:school_management_system_01/loginsformat/login_as_director.dart';
import 'package:school_management_system_01/loginsformat/login_as_parent.dart';
import 'package:school_management_system_01/loginsformat/login_as_responsible.dart';
import 'package:school_management_system_01/loginsformat/login_as_student.dart';
import 'package:school_management_system_01/loginsformat/login_as_teacher.dart';
import 'backEnd/services/auth_provider.dart';
import 'dashBoardStudent/landingStudent.dart';
import 'dashboardTeacher/landingTeacher.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OnBoardingPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) => AuthProvider(
    auth: Auth(),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            padding: const EdgeInsets.only(top: 90.0),
            child: IntroductionScreen(
              pages: [
                PageViewModel(
                  title: 'LOG IN AS',
                  body: 'RESPONSIBLE',
                  footer: Column(
                    children: [
                      SizedBox(height: 50.0),
                      ElevatedButton(
                        onPressed: () {
                          
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LandingResponsiblePage(auth: Auth(),)),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            padding:
                                EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            primary: Colors.blue.shade900),
                        child: Text(
                          "LOG AS A RESPONSIBLE",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  image: buildImage('assets/images/2.jpg'),
                  decoration: getPageDecoration(),
                ),
                PageViewModel(
                  title: 'LOG IN AS',
                  body: 'TEACHER',
                  footer: Column(
                    children: [
                      SizedBox(height: 50.0),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LandingTeacher(auth: Auth(),)),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            padding:
                                EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            primary: Colors.blue.shade900),
                        child: Text(
                          "LOG AS A TEACHER",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  image: buildImage('assets/images/3.jpg'),
                  decoration: getPageDecoration(),
                ),
                PageViewModel(
                  title: 'LOG IN AS',
                  body: 'STUDENT',
                  footer: Column(
                    children: [
                      SizedBox(height: 50.0),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LandingStudentPage(auth: Auth(),)),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            padding:
                                EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            primary: Colors.blue.shade900),
                        child: Text(
                          "LOG AS A STUDENT",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  image: buildImage('assets/images/4.jpg'),
                  decoration: getPageDecoration(),
                ),
              ],
              done: Text('return', style: TextStyle(fontWeight: FontWeight.w600)),
              onDone: () => goToHome(context),
              showSkipButton: true,
              skip: Text("Skip"),
              onSkip: () => goToHome(context),
              next: Icon(Icons.arrow_forward),
              dotsDecorator: getDotDecoration(),
              onChange: (index) => print('Page $index selected'),
              globalBackgroundColor: Theme.of(context).primaryColor,
              isProgressTap: false,
              skipFlex: 0,
              nextFlex: 0,
              animationDuration: 1000,
            ),
          ),
        ),
  );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => MyApp()),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));
  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Color(0xFFBDBDBD),
        activeColor: Colors.blue.shade500,
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );
  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20),
        descriptionPadding: EdgeInsets.all(0).copyWith(bottom: 0),
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
        footerPadding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
      );
}
