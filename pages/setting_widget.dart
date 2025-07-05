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

Widget inputSettingTile({
  required String title,
  required BuildContext context,
}) {
  return ListTile(
    title: Text(title, style: tileTextStyle),
    trailing: Icon(Icons.arrow_right_alt),
    onTap: () {
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 0.3,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FractionallySizedBox(
                      widthFactor: 0.9,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: '타이틀을 자유롭게 꾸며보세요!',
                          border: OutlineInputBorder(),
                          fillColor: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    FractionallySizedBox(
                      widthFactor: 0.9,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: EdgeInsets.symmetric(),
                          shape: 
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          '확인',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
