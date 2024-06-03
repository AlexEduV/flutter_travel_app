import 'package:flutter/material.dart';
import 'package:flutter_travel_test/styles/colors.dart';
import 'package:flutter_travel_test/widgets/app_button.dart';
import 'package:flutter_travel_test/widgets/app_large_text.dart';
import 'package:flutter_travel_test/widgets/app_text.dart';
import 'package:gap/gap.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  final int stars = 3;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [

            //background image
            Positioned(
                child: Container(
                  height: 350,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/mountain.jpeg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                )
            ),

            //top bar
            Positioned(
              left: 20,
              top: 50,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //menu button
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),

                  //more button
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                  ),

                ],
              ),
            ),

            //details
            Positioned(
              top: 320,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Gap(30.0),

                    //name and price
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: 'Yosemite',
                          color: Colors.black87,
                          fontSize: 28,
                        ),

                        AppLargeText(
                          text: '\$ 250',
                          color: AppColors.mainColor,
                          fontSize: 28,
                        ),
                      ],
                    ),

                   const Gap(10.0),

                    //location (icon and text)
                    const Row(
                      children: [
                        Icon(Icons.location_pin, color: AppColors.mainColor,),

                        Gap(5.0),

                        AppText(
                          text: 'USA, California',
                          color: AppColors.mainColor,
                          textSize: 15.0,
                        ),
                      ],
                    ),

                    const Gap(10.0),

                    //stars
                    Row(
                      children: [
                        Wrap(
                          children:
                            List.generate(5, (index) {
                              return Icon(
                                index < stars ? Icons.star: Icons.star_border,
                                color: index < stars ? AppColors.starColor : AppColors.textColor1,
                              );
                            })
                        ),

                        const Gap(10.0),

                        AppText(
                          text: '($stars.0)',
                          color: AppColors.textColor2,
                        ),
                      ],
                    ),

                    const Gap(40.0),

                    const AppLargeText(
                      text: 'People',
                      color: Colors.black87,
                      fontSize: 20,
                    ),

                    const Gap(5.0),

                    const AppText(
                      text: 'Number of people in your group',
                      color: AppColors.mainTextColor,
                    ),

                    const Gap(5.0),

                    Wrap(
                      spacing: 8.0,
                      children: List.generate(5, (index) {

                        return AppButton(
                          backgroundColor: AppColors.buttonBackgroundColor,
                          text: '${index + 1}',
                          color: Colors.black87,
                          size: 55,
                        );

                      }),
                    )

                    
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
