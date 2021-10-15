import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_management_system_01/dashboardResponsible/grids%20destination/recieved_messages_page.dart';
import 'package:school_management_system_01/dashboardResponsible/manage_students/manage%20student%20grids%20destination/text_someone.dart';
import 'package:school_management_system_01/dashboardResponsible/settingsPage/settings%20%20grids%20destination/profil.dart';
import 'package:school_management_system_01/dashboardTeacher/grids%20destination/Classes_info.dart';
import 'package:school_management_system_01/dashboardTeacher/grids%20destination/Corses.dart';
import 'package:school_management_system_01/dashboardTeacher/grids%20destination/Exams_notes.dart';
import 'package:school_management_system_01/dashboardTeacher/grids%20destination/Tps.dart';
import 'package:school_management_system_01/dashboardTeacher/manage_teacher_notes/manage_notes_teacher_grid_distination/addNotes.dart';

class TeacherGridDashboard extends StatelessWidget {

  Items item1 = new Items(
      title: "Courses",
      subtitle: "March, Wednesday",
      page: CorsesPage(),
      img: "assets/images/081-reading.png"
  );
  Items item2 = new Items(
    title: "Tps",
    subtitle: "Bocali, Apple",
    page: TpsPage(),
    img: "assets/images/004-assignment.png",
  );
  Items item3 = new Items(
    title: "Axams Notes",
    subtitle: "Lucy Mao going to Office",
    page: AddNotesPage(),
    img: "assets/images/010-A+.png",
  );
  Items item4 = new Items(
    title: "My Settings",
    subtitle: "Rose favirited your Post",
    page: ProfilPage(),
    img: "assets/images/076-problem solving.png",
  );
  Items item5 = new Items(
    title: "Recieved Messeges",
    subtitle: "Homework, Design",
    page: RecievedMessagesPage(),
    img: "assets/images/080.png",
  );
  Items item6 = new Items(
    title: "Text Someone",
    subtitle: "dddd",
    page: TextSomeonePage(),
    img: "assets/images/001.png",
  );


  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    //var color = 0xff453658;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
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