import 'package:flutter/material.dart';
import 'package:flutter_travel_test/styles/colors.dart';
import 'package:flutter_travel_test/widgets/app_large_text.dart';
import 'package:flutter_travel_test/widgets/app_text.dart';
import 'package:gap/gap.dart';

class ResponsiveButton extends StatelessWidget {

  final bool? isResponsive;
  final double? width;
  final String? text;

  const ResponsiveButton({
    super.key,
    this.isResponsive,
    this.width,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.mainColor,
      ),

      child: Row(
        mainAxisAlignment: text == null ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
        children: [

          AppLargeText(text: text ?? '', color: Colors.white, fontSize: 14,),

          Image.asset("assets/images/button-one.png"),
        ],
      ),
    );
  }
}
