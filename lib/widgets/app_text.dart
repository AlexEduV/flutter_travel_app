import 'package:flutter/material.dart';

class AppText extends StatelessWidget {

  final double fontSize;
  final String text;
  final Color color;

  const AppText({
    super.key,
    this.fontSize = 16,
    required this.text,
    this.color = Colors.black54,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w300
      ),
    );
  }
}
