import 'package:flutter/material.dart';
import 'package:post_app/screens/calendar_screen.dart';
import 'package:post_app/utils/functions.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        width: double.infinity,
        height: 500,
        child: SfCalendar(
          headerDateFormat: 'MMM',
          headerStyle: CalendarHeaderStyle(
            backgroundColor: Colors.transparent,
            textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          headerHeight: 50,
          cellBorderColor: Colors.transparent,
          view: CalendarView.month,
          selectionDecoration: const BoxDecoration(),
          dataSource: _getCalendarDataSource(),
          todayHighlightColor: Colors.tealAccent,
          monthViewSettings: const MonthViewSettings(
            appointmentDisplayMode:
                MonthAppointmentDisplayMode.appointment, // boxes append options
            showAgenda: false,
          ),

          onTap: (calendarTapDetails) {
            if (calendarTapDetails.targetElement ==
                CalendarElement.calendarCell) {
              final selectedDate = calendarTapDetails.date!;
              showDialog(
                context: context,
                builder: (context) => showMainPlanDialog(context, selectedDate),
              );
            }
          },
        ),
      ),
    );
  }
}

Widget showMainPlanDialog(BuildContext context, DateTime date) {
  return AlertDialog(
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${date.month}월 ${date.day}일 (${getWeekday(date.weekday)}) ",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        Text(getDDay(date), style: TextStyle(fontSize: 12)),
      ],
    ),
    content: SizedBox(
      width: 300,
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            dayScheduleBox(
              'clean my room 08:00–11:00',
              '일상',
              Color(0xFF91B5F3),
              Color(0xFFEDEFFF),
            ),
            dayScheduleBox(
              'clean my room 08:00–11:00',
              '일상',
              Color(0xFF91B5F3),
              Color(0xFFEDEFFF),
            ),
            dayScheduleBox(
              'clean my room 08:00–11:00',
              '일상',
              Color(0xFF91B5F3),
              Color(0xFFEDEFFF),
            ),
            dayScheduleBox(
              'clean my room 08:00–11:00',
              '일상',
              Color(0xFF91B5F3),
              Color(0xFFEDEFFF),
            ),
            dayScheduleBox(
              'clean my room 08:00–11:00',
              '일상',
              Color(0xFF91B5F3),
              Color(0xFFEDEFFF),
            ),
            dayScheduleBox(
              'clean my room 08:00–11:00',
              '일상',
              Color(0xFF91B5F3),
              Color(0xFFEDEFFF),
            ),
            dayScheduleBox(
              'clean my room 08:00–11:00',
              '일상',
              Color(0xFF91B5F3),
              Color(0xFFEDEFFF),
            ),
          ],
        ),
      ),
    ),
    actions: [],
  );
}

void insertPlanDialog(BuildContext context, DateTime date) {
  final TextEditingController controller = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("${date.month}월 ${date.day}일 계획 추가"),
        content: TextField(controller: controller),
        actions: [],
      );
    },
  );
}

MeetingDataSource _getCalendarDataSource() {
  final List<Appointment> meetings = <Appointment>[];

  meetings.add(
    Appointment(
      startTime: DateTime.now().add(const Duration(hours: 1)),
      endTime: DateTime.now().add(const Duration(hours: 2)),
      subject: '🧠 Project Meeting',
      color: Colors.blue,
    ),
  );

  meetings.add(
    Appointment(
      startTime: DateTime.now().add(const Duration(days: 2, hours: 3)),
      endTime: DateTime.now().add(const Duration(days: 2, hours: 4)),
      subject: '📚 Study Session',
      color: Colors.green,
    ),
  );

  return MeetingDataSource(meetings);
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
