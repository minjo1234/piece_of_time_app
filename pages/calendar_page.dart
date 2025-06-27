import 'package:flutter/material.dart';
import 'package:post_app/screens/calendar_screen.dart';
import 'package:post_app/screens/floating_input_overlay.dart';
import 'package:post_app/utils/functions.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(leading: Icon(Icons.abc)),
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
    content: Builder(
      builder: (innerContext) {
        return SizedBox(
          width: 400,
          height: 500,
          child: Column(
            children: [
              // 🔹 스크롤 가능한 일정 리스트
              Expanded(
                child: ListView(
                  children: [
                    dayScheduleBox(
                      innerContext,
                      'clean my room 08:00–11:00',
                      '일상',
                      Color(0xFF91B5F3),
                      Color(0xFFEDEFFF),
                    ),
                    dayScheduleBox(
                      innerContext,
                      'clean my room 11:30–12:30',
                      '일상',
                      Color(0xFF91B5F3),
                      Color(0xFFEDEFFF),
                    ),
                    dayScheduleBox(
                      innerContext,
                      'clean my room 13:00–15:00',
                      '일상',
                      Color(0xFF91B5F3),
                      Color(0xFFEDEFFF),
                    ),
                    dayScheduleBox(
                      innerContext,
                      'clean my room 15:30–16:30',
                      '일상',
                      Color(0xFF91B5F3),
                      Color(0xFFEDEFFF),
                    ),
                    dayScheduleBox(
                      innerContext,
                      'clean my room 17:00–18:00',
                      '일상',
                      Color(0xFF91B5F3),
                      Color(0xFFEDEFFF),
                    ),
                    dayScheduleBox(
                      innerContext,
                      'clean my room 18:30–19:30',
                      '일상',
                      Color(0xFF91B5F3),
                      Color(0xFFEDEFFF),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),
              // 🔸 고정된 하단 버튼
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F3F5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "+ 할 일을 추가하세요",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        );
      },
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

Future<void> showBottomScheduleModal(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    isScrollControlled: true,
    builder: (context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        width: double.infinity,
        child: Column(
          children: [
            TextField(
              scrollPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              focusNode: FocusNode(),
              decoration: InputDecoration(
                hintText: '할 일을 입력하세요. ',
                hintStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            Container(
              decoration: BoxDecoration(color: Colors.amber),
              height: 30,
            ),
            SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
            // Your modal content here
          ],
        ),
      );
    },
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
  );
}

void showFloatingInput(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.transparent,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (context, animation, secondaryAnimation) {
      return const FloatingInputOverlay();
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
      color: Color(0xFFEDEFFF),
    ),
  );

  meetings.add(
    Appointment(
      startTime: DateTime.now().add(const Duration(days: 1, hours: 1)),
      endTime: DateTime.now().add(const Duration(hours: 2)),
      subject: '🧠 Project Meeting',
      color: Color(0xFF91B5F3),
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
