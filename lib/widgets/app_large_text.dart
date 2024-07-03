import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {

  final double fontSize;
  final String text;
  final Color color;
  final bool isShadowOn;

  const AppLargeText({
    super.key,
    this.fontSize = 30,
    required this.text,
    this.color = Colors.black87,
    this.isShadowOn = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.bold,
        height: 0.9,
        shadows: isShadowOn ? const <Shadow>[
          Shadow(
            blurRadius: 3.0,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ] : [],
      ),
    );
  }
}
