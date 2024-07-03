import 'package:flutter/material.dart';

class AppText extends StatelessWidget {

  final double fontSize;
  final String text;
  final Color color;
  final bool isShadowOn;

  const AppText({
    super.key,
    this.fontSize = 16,
    required this.text,
    this.color = Colors.black54,
    this.isShadowOn = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: FontWeight.w300,
        shadows: isShadowOn ? const <Shadow>[
          Shadow(
            blurRadius: 3.0,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ] : [],
      )
    );
  }
}
