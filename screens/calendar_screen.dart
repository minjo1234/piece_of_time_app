import 'package:flutter/material.dart';

Widget dayScheduleBox(
  String title,
  String category,
  Color iconColor,
  Color backgroundColor,
) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 3),
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    decoration: BoxDecoration(
      color: backgroundColor, // Background color (change per category)
      borderRadius: BorderRadius.circular(12),
    ),
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              category, // category
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Icon(
              Icons.check_box_outline_blank,
              size: 18,
              color: iconColor, // match border color
            ),
          ],
        ),
      ],
    ), // Background color (change per category)
  );
}
