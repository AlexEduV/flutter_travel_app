import 'package:flutter/material.dart';
import 'package:flutter_travel_test/widgets/app_large_text.dart';

class AppButton extends StatelessWidget {

  final Color color;
  final Color backgroundColor;
  final Icon? icon;
  final String? text;
  final double size;

  const AppButton({
    required this.backgroundColor,
    required this.color,
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
        color: backgroundColor,
      ),
      child: Center(
        child: AppLargeText(
          text: text ?? '',
          fontSize: 20,
          color: color,
        ),
      ),
    );
  }
}
