import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_management_system_01/dashboardResponsible/grids%20destination/manage_classes_page.dart';
import 'package:school_management_system_01/dashboardResponsible/grids%20destination/manage_parents_page.dart';
import 'package:school_management_system_01/dashboardResponsible/grids%20destination/manage_students_page.dart';
import 'package:school_management_system_01/dashboardResponsible/grids%20destination/manage_teachers_page.dart';
import 'package:school_management_system_01/dashboardResponsible/grids%20destination/recieved_messages_page.dart';
import 'package:school_management_system_01/dashboardResponsible/grids%20destination/settings_page.dart';
import 'package:school_management_system_01/dashboardResponsible/settingsPage/settings%20%20grids%20destination/profil.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
      title: "Manage Teachers",
      subtitle: "March, Wednesday",
      page: ManageTeachersPage(),
      img: "assets/images/079.png");

  Items item2 = new Items(
    title: "Manage Student",
    subtitle: "Bocali, Apple",
    page: ManageStudentsPage(),
    img: "assets/images/009.png",
  );
  Items item3 = new Items(
    title: "Manage Parents",
    subtitle: "Lucy Mao going to Office",
    page: ManageParentsPage(),
    img: "assets/images/106-vision.png",
  );
  Items item4 = new Items(
    title: "Manage Classes",
    subtitle: "Rose favirited your Post",
    page: ManageClassesPage(),
    img: "assets/images/047-class.png",
  );
  Items item5 = new Items(
    title: "Recieved Messeges",
    subtitle: "Homework, Design",
    page: RecievedMessagesPage(),
    img: "assets/images/080.png",
  );
  Items item6 = new Items(
    title: "Settings",
    subtitle: "dddd",
    page: ProfilPage(),
    img: "assets/images/076-problem solving.png",
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
