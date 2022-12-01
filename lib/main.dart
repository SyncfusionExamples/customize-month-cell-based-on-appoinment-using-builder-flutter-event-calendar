import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(const Appointment_MonthCellBuilder());

class Appointment_MonthCellBuilder extends StatelessWidget {
  const Appointment_MonthCellBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SafeArea(
              child: SfCalendar(
                view: CalendarView.month,
                monthCellBuilder: monthCellBuilder,
                dataSource: _getCalendarDataSource(),
              ),
            )));
  }

  Widget monthCellBuilder(BuildContext context, MonthCellDetails details) {

    if (details.appointments.isNotEmpty) {
      Appointment appointment=details.appointments[0] as Appointment;
      return Container(
        color: appointment.color,
        child: Text(appointment.subject),
      );
    }
    return Container(
      color: Colors.blueGrey,
      child: Text(details.date.day.toString()),
    );
  }

  _AppointmentDataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];
    appointments.add(Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(const Duration(hours: 1)),
      subject: 'Meeting',
      color: Colors.blue,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(days: -5)),
      endTime: DateTime.now().add(const Duration(days: -5)),
      subject: 'Planning',
      color: Colors.deepOrangeAccent,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(days: -9)),
      endTime: DateTime.now().add(const Duration(days: -9)),
      subject: 'Consulting',
      color: Colors.pink,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(days: -15)),
      endTime: DateTime.now().add(const Duration(days: -15)),
      subject: 'Retrospective',
      color: Colors.purpleAccent,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(days: 15)),
      endTime: DateTime.now().add(const Duration(days:15)),
      subject: 'Customer Meeting',
      color: Colors.amber,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(days: 5)),
      endTime: DateTime.now().add(const Duration(days: 5)),
      subject: 'Sprint Plan',
      color: Colors.lightGreenAccent,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(days: 9)),
      endTime: DateTime.now().add(const Duration(days: 9)),
      subject: 'Weekly Report',
      color: Colors.lime,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(days: 3)),
      endTime: DateTime.now().add(const Duration(days: 3)),
      subject: 'Meeting',
      color: Colors.cyan,
    ));

    return _AppointmentDataSource(appointments);
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}