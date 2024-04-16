import 'package:flutter/material.dart';
import 'package:flutter_travel_test/styles/colors.dart';

class ResponsiveButton extends StatelessWidget {

  final bool? isResponsive;
  final double? width;

  const ResponsiveButton({
    super.key,
    this.isResponsive,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.mainColor,
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/button-one.png"),
        ],
      ),
    );
  }
}
