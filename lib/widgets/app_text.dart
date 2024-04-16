import 'package:flutter/material.dart';

class AppText extends StatelessWidget {

  final double textSize;
  final String text;
  final Color color;

  const AppText({
    super.key,
    this.textSize = 16,
    required this.text,
    this.color = Colors.black54,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: textSize,
        color: color,
        fontWeight: FontWeight.w300
      ),
    );
  }
}
