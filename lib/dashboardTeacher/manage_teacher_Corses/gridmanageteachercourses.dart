import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_management_system_01/dashboardTeacher/manage_teacher_Corses/manage_Corses_Techer_grids_destination/addCourse.dart';
import 'package:school_management_system_01/dashboardTeacher/manage_teacher_Corses/manage_Corses_Techer_grids_destination/seeClassCourses.dart';

import '../teachergriddashoard.dart';

class GridManageTeacherCourses extends StatelessWidget {

  Items item1 = new Items(
      title: "Add A Course",
      subtitle: "March, Wednesday",
      page: AddCoursePage(),
      img: "assets/images/036-elearning.png"
    );

  Items item2 = new Items(
    title: "See A Class Courses ",
    subtitle: "Bocali, Apple",
    page: SeeClassCoursesPage(),
    img: "assets/images/044-global education.png",
  );


  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2];
    //var color = 0xff453658;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1,
          padding: EdgeInsets.only(left: 100, right: 100),
          crossAxisCount: 1,
          crossAxisSpacing: 18,
          mainAxisSpacing: 100,
          children: myList.map((data) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => data.page)
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      data.img,
                      width: 60,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      data.title,
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      data.subtitle,
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white38,
                              fontSize: 10,
                              fontWeight: FontWeight.w600)),
                    ),
                    
                    /*Text(
                      data.event,
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                              fontWeight: FontWeight.w600)),
                    ),*/
                  ],
                ),
              ),
            );
          }).toList()),
    );
  }
}