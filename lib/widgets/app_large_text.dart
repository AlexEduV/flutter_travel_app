import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {

  final double textSize;
  final String text;
  final Color color;

  const AppLargeText({
    super.key,
    this.textSize = 30,
    required this.text,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: textSize,
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
