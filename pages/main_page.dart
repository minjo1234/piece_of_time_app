import 'package:flutter/material.dart';
import 'package:post_app/pages/appBar/main_app_bar.dart';
import 'package:post_app/pages/calendar_page.dart';
import 'package:post_app/pages/notification_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: MainAppBar(), body: CalendarPage());
  }
}
