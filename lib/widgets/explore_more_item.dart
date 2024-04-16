import 'package:flutter/material.dart';
import 'package:flutter_travel_test/styles/colors.dart';
import 'package:flutter_travel_test/widgets/app_text.dart';

class exploreMoreItem extends StatelessWidget {

  final String imageSource;
  final Color tintColor;
  final String label;

  const exploreMoreItem({
    super.key,
    required this.imageSource,
    required this.tintColor,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        //image rounded tinted
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.5),
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),

        //text
        AppText(
          text: label,
          color: AppColors.textColor2,
        ),

      ],
    );
  }
}
