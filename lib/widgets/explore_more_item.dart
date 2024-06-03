import 'package:flutter/material.dart';
import 'package:flutter_travel_test/styles/colors.dart';
import 'package:flutter_travel_test/widgets/app_text.dart';

class exploreMoreItem extends StatelessWidget {

  final String imageSource;
  final String label;

  const exploreMoreItem({
    super.key,
    required this.imageSource,
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
            borderRadius: BorderRadius.circular(64.0),
            image:DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                imageSource,
              ),
            ),
          ),
        ),

        //text
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: AppText(
            text: label,
            fontSize: 12,
            color: AppColors.textColor2,
          ),
        ),

      ],
    );
  }
}
