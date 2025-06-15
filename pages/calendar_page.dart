import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCalendar(
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
        monthViewSettings: const MonthViewSettings(showAgenda: true),
        onTap: (calendarTapDetails) {
          if (calendarTapDetails.targetElement ==
              CalendarElement.calendarCell) {
            final selectedDate = calendarTapDetails.date!;
            showDialog(
              context: context,
              builder: (context) => _buildPlanDialog(context, selectedDate),
            );
          }
        },
      ),
    );
  }
}

Widget _buildPlanDialog(BuildContext context, DateTime date) {
  final TextEditingController _controller = TextEditingController();

  return AlertDialog(
    title: Text("${date.month}월 ${date.day}일 계획 추가"),
    content: TextField(
      controller: _controller,
      decoration: const InputDecoration(hintText: "무엇을 할 건가요?"),
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text("취소"),
      ),
      ElevatedButton(
        onPressed: () {
          final text = _controller.text;
          if (text.isNotEmpty) {
            // 👉 TODO: 저장 로직 (예: setState or add to dataSource)
            print("📅 $date: $text");
          }
          Navigator.pop(context);
        },
        child: const Text("저장"),
      ),
    ],
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
