import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_management_system_01/dashboardResponsible/settingsPage/settings%20%20grids%20destination/profil.dart';
import 'package:school_management_system_01/dashboardResponsible/settingsPage/settings%20%20grids%20destination/themeApp.dart';

import '../griddashboard.dart';

class GridSettings extends StatefulWidget {
  @override
  _GridSettingsState createState() => _GridSettingsState();
}

class _GridSettingsState extends State<GridSettings> {

  Items item1 = new Items(
      title: "Profil",
      subtitle: "March, Wednesday",
      page: ProfilPage(),
      img: "assets/images/074-potential.png"
    );

  Items item2 = new Items(
    title: "Theme app",
    subtitle: "Bocali, Apple",
    page: ThemeAppPage(),
    img: "assets/images/071-online university.png",
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