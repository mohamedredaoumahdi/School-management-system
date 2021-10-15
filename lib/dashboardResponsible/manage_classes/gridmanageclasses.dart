import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_management_system_01/dashboardResponsible/manage_classes/manage%20classes%20grids%20destination/add_class.dart';
import 'package:school_management_system_01/dashboardResponsible/manage_classes/manage%20classes%20grids%20destination/delete_calss.dart';
import 'package:school_management_system_01/dashboardResponsible/manage_classes/manage%20classes%20grids%20destination/update_class.dart';
import 'package:school_management_system_01/dashboardResponsible/manage_classes/manage%20classes%20grids%20destination/view_classes.dart';

import '../griddashboard.dart';

class GridManageClasses extends StatefulWidget {
  @override
  _GridManageClassesState createState() => _GridManageClassesState();
}

class _GridManageClassesState extends State<GridManageClasses> {

  Items item1 = new Items(
      title: "Add Class",
      subtitle: "March, Wednesday",
      page: AddClassPage(),
      img: "assets/images/023-creative teaching.png"
    );

  Items item2 = new Items(
    title: "Delete Class",
    subtitle: "Bocali, Apple",
    page: DeleteClassPage(),
    img: "assets/images/079.png",
  );
  Items item3 = new Items(
    title: "View Classes",
    subtitle: "Lucy Mao going to Office",
    page: ViewClassesPage(),
    img: "assets/images/107-webinar.png",
  );

  
  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3];
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