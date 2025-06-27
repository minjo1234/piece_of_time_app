import 'package:flutter/material.dart';

class MainBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const MainBottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon:
              selectedIndex == 0 ? Icon(Icons.home) : Icon(Icons.home_outlined),
          label: '',
        ),
        BottomNavigationBarItem(
          icon:
              selectedIndex == 1
                  ? Icon(Icons.calendar_month)
                  : Icon(Icons.calendar_month_outlined),
          label: '',
        ),
      ],
      onTap: onTap,
    );
  }
}
