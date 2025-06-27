import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: const Text("카테고리 설정", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      // ✅ Scrollable content
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: "카테고리를 입력하세요",
                filled: true,
                fillColor: Color(0xFFF1F3F5),
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 24),
            const Text("색상 선택", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),

            // ✅ Scrollable schedule boxes
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: List.generate(planitColors.length, (index) {
                return colorCircle(
                  planitColors[index],
                  index == 2,
                ); // select index 2 for demo
              }),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("비공개 카테고리"),
                Switch(value: false, onChanged: (_) {}),
              ],
            ),
            const SizedBox(
              height: 100,
            ), // 🔽 ensure scroll does not hide bottom button
          ],
        ),
      ),

      // ✅ Fixed button at the bottom
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4B6EF5),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            "저장",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

// ✅ Color dot with optional check mark
Widget colorCircle(Color color, bool isSelected) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
      if (isSelected) const Icon(Icons.check, color: Colors.white, size: 28),
    ],
  );
}

final List<Color> planitColors = [
  Color(0xFFF79CA7),
  Color(0xFFBDB2FF),
  Color(0xFF9ADCFF),
  Color(0xFFFDCB6E),
  Color(0xFFB5EAD7),
  Color(0xFFD6D6F5),
  Color(0xFF9E9E9E),
];
