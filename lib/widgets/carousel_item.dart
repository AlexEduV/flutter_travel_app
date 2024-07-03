import 'package:flutter/material.dart';
import 'package:flutter_travel_test/widgets/app_large_text.dart';
import 'package:gap/gap.dart';

import 'app_text.dart';

class CarouselItem extends StatelessWidget {
  final String imageSource;

  final String name;
  final String location;

  const CarouselItem({
    super.key,
    required this.imageSource,
    required this.name,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [

        //picture
        Container(
          height: 300,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
            image: DecorationImage(
              image: NetworkImage(imageSource),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //info column
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: const LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //name
                AppLargeText(
                  text: name,
                  fontSize: 18,
                  color: Colors.white,
                  isShadowOn: true,
                ),

                const Gap(3.0),

                //location
                Row(
                  children: [

                    //location icon
                    const Icon(
                      Icons.location_pin,
                      color: Colors.white,
                      size: 12,
                    ),

                    const Gap(5.0),

                    //location text
                    AppText(
                      text: location,
                      color: Colors.white,
                      fontSize: 12,
                      isShadowOn: true,
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),

      ],
    );
  }
}
