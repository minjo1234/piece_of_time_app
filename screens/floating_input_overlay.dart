import 'package:flutter/material.dart';

class FloatingInputOverlay extends StatefulWidget {
  const FloatingInputOverlay({super.key});

  @override
  State<FloatingInputOverlay> createState() => _FloatingInputOverlayState();
}

class _FloatingInputOverlayState extends State<FloatingInputOverlay> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 12, // 키보드 위에!
          left: 16,
          right: 16,
        ),
        child: Material(
          borderRadius: BorderRadius.circular(16),
          elevation: 4,
          color: Colors.white,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    autofocus: true,
                    controller: _controller,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: '할 일을 입력하세요',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    print('입력 내용: ${_controller.text}');
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
