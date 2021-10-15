import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_management_system_01/dashboardTeacher/manage_teacher_notes/manage_notes_teacher_grid_distination/addNotes.dart';
import 'package:school_management_system_01/dashboardTeacher/manage_teacher_notes/manage_notes_teacher_grid_distination/seeNotes.dart';

import '../teachergriddashoard.dart';

class GridManageTeacherNotes extends StatelessWidget {

  Items item1 = new Items(
      title: "Add Notes",
      subtitle: "March, Wednesday",
      page: AddNotesPage(),
      img: "assets/images/095-notes.png");

  Items item2 = new Items(
    title: "See A Exam Notes ",
    subtitle: "Bocali, Apple",
    page: SeeNotesPage(),
    img: "assets/images/096.png",
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => data.page));
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