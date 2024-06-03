import 'package:flutter/material.dart';
import 'package:flutter_travel_test/widgets/app_large_text.dart';

class AppButton extends StatelessWidget {

  final Color color;
  final Color backgroundColor;
  final IconData? icon;
  final String? text;
  final double size;
  final Color borderColor;

  const AppButton({
    required this.backgroundColor,
    required this.color,
    required this.borderColor,
    this.size=60,
    this.text,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: borderColor,
        ),
        color: backgroundColor,
      ),
      child: Center(
        child: text != null ? AppLargeText(
          text: text ?? '',
          fontSize: 20,
          color: color,
        ) : Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
