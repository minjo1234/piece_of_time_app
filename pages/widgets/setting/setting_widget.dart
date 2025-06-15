import 'package:flutter/material.dart';

TextStyle settingTextStyle = TextStyle(fontSize: 20);

TextStyle tileTextStyle = TextStyle(fontSize: 16);

Widget buildSettingSection(List<Widget> titles) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      border: Border.all(width: 0.1),
    ),
    child: Column(
      children:
          ListTile.divideTiles(
            color: Colors.grey,
            context: null,
            tiles: titles,
          ).toList(),
    ),
  );
}

Widget buildRadioTile({
  required String title,
  required bool selected,
  required VoidCallback onTap,
}) {
  return ListTile(
    title: Text(title, style: tileTextStyle),
    trailing: selected ? const Icon(Icons.check) : null,
    onTap: onTap,
  );
}
