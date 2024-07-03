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
          margin: const EdgeInsets.only(right: 10.0,),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            image: DecorationImage(
              image: NetworkImage(imageSource),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //info column
        Positioned(
          bottom: 10,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //name
              AppLargeText(
                text: name,
                fontSize: 18,
                color: Colors.white,
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
                  ),
                ],
              ),

            ],
          ),
        ),

      ],
    );
  }
}
