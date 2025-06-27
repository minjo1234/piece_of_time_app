import 'package:flutter/material.dart';
import 'package:post_app/pages/appBar/main_app_bar.dart';
import 'package:post_app/pages/calendar_page.dart';
import 'package:post_app/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showOptions = false;
  bool isMine = false;

  final GlobalKey _avaterKey = GlobalKey();
  Offset? _optionPosition;

  void _toggleOptions() {
    final RenderBox rendarBox =
        _avaterKey.currentContext!.findRenderObject() as RenderBox;
    final Offset position = rendarBox.localToGlobal(Offset.zero);

    setState(() {
      _optionPosition = Offset(
        position.dx,
        position.dy + rendarBox.size.height,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double circleRadius = 30.0;

    return Column(
      children: [
        MainAppBar(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ProfilePage();
                            },
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          CircleAvatar(radius: 40),
                          const SizedBox(height: 8),
                          const Text('조민'),
                        ],
                      ),
                    ),

                    const SizedBox(width: 16),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => _friendCalendar(context),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          CircleAvatar(radius: 40),
                          const SizedBox(height: 8),
                          const Text('고동영'),
                        ],
                      ),
                    ),

                    const SizedBox(width: 16),
                    InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          CircleAvatar(radius: 40),
                          const SizedBox(height: 8),
                          const Text('전이주'),
                        ],
                      ),
                    ),

                    const SizedBox(width: 16),
                    InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          CircleAvatar(radius: 40),
                          const SizedBox(height: 8),
                          const Text('정아라미'),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                showOptions = !showOptions;
                              });
                            },
                            child: Column(
                              children: const [
                                CircleAvatar(
                                  radius: 40,
                                  child: Icon(Icons.person_add),
                                ),
                                SizedBox(height: 8),
                                Text('친구 추가'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (showOptions)
                const Positioned(
                  right: 180,
                  bottom: 550,
                  child: FloatingOptionBox(),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _friendCalendar(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: CalendarPage(),
    );
  }
}

class FloatingOptionBox extends StatelessWidget {
  const FloatingOptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Material(
        elevation: 100,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('아이디로 찾기'),
              SizedBox(height: 8),
              Text('링크 복사'),
              SizedBox(height: 8),
              Text('카카오톡으로 초대'),
            ],
          ),
        ),
      ),
    );
  }
}
