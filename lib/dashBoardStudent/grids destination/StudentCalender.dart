import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class StudentCalender extends StatefulWidget {
  @override
  _StudentCalenderState createState() => _StudentCalenderState();
}

class _StudentCalenderState extends State<StudentCalender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(" Semaine calender ",
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.blue.shade900, fontSize: 18)),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.blue.shade900),
          onPressed: () => Navigator.of(context).pop(),
        ),
        leadingWidth: 100,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SfCalendar(
        view: CalendarView.week,
        firstDayOfWeek: 1,
        dataSource: MeetingDataSource(getAppointments()),
      ),
    );
  }
}

List<Appointment> getAppointments() {
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  meetings.add(Appointment(
      startTime: startTime,
      endTime: endTime,
      subject: 'Board Meeting',
      color: Colors.blue,
      //recurrenceRule: 'FREQ=DAILY;COUNT=10',
      //isAllDay: false
      ));

  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}