import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_management_system_01/dashboardResponsible/grids%20destination/manage_classes_page.dart';
import 'package:school_management_system_01/dashboardResponsible/grids%20destination/manage_parents_page.dart';
import 'package:school_management_system_01/dashboardResponsible/grids%20destination/manage_students_page.dart';
import 'package:school_management_system_01/dashboardResponsible/grids%20destination/manage_teachers_page.dart';
import 'package:school_management_system_01/dashboardResponsible/grids%20destination/recieved_messages_page.dart';
import 'package:school_management_system_01/dashboardResponsible/manage_students/manage%20student%20grids%20destination/add_student.dart';
import 'package:school_management_system_01/dashboardResponsible/manage_students/manage%20student%20grids%20destination/delete_student.dart';
import 'package:school_management_system_01/dashboardResponsible/manage_students/manage%20student%20grids%20destination/text_someone.dart';
import 'package:school_management_system_01/dashboardResponsible/manage_students/manage%20student%20grids%20destination/update_student.dart';
import 'package:school_management_system_01/dashboardResponsible/manage_students/manage%20student%20grids%20destination/update_student_fee.dart';
import 'package:school_management_system_01/dashboardResponsible/manage_students/manage%20student%20grids%20destination/view_student.dart';

class GridManageStudents extends StatelessWidget {
  Items item1 = new Items(
      title: "Add Student",
      subtitle: "March, Wednesday",
      page: AddStudentPage(),
      img: "assets/images/094.png");

  Items item2 = new Items(
    title: "Delete Student",
    subtitle: "Bocali, Apple",
    page: DeleteStudentPage(),
    img: "assets/images/097.png",
  );
  Items item3 = new Items(
    title: "View Students",
    subtitle: "Lucy Mao going to Office",
    page: ViewStudentPage(),
    img: "assets/images/022.png",
  );
  
  Items item6 = new Items(
    title: "Text someone",
    subtitle: "dddd",
    page: TextSomeonePage(),
    img: "assets/images/001.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item6];
    //var color = 0xff453658;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.5,
          padding: EdgeInsets.only(left: 100, right: 100),
          crossAxisCount: 1,
          crossAxisSpacing: 18,
          mainAxisSpacing: 25,
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
                    SizedBox(
                      height: 14,
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

class Items {
  String title;
  String subtitle;
  //String event;
  String img;
  Widget page;
  Items(
      {required this.title,
      required this.subtitle,
      required this.page,
      required this.img});
}
