import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_test/cubit/app_cubits.dart';
import 'package:flutter_travel_test/styles/colors.dart';
import 'package:flutter_travel_test/widgets/app_large_text.dart';
import 'package:flutter_travel_test/widgets/app_text.dart';
import 'package:flutter_travel_test/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  List images = [
    "assets/images/welcome-one.png",
    "assets/images/welcome-two.png",
    "assets/images/welcome-three.png",
  ];

  List titles = [
    "Trips",
    "Discover",
    "Discover"
  ];

  List subtitles = [
    "Mountain",
    "Lake",
    "Lake",
  ];

  List texts = [
    'Mountain hikes give you an incredible '
        'sense of freedom along with endurance tests',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // a slider
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_, index) {
          return Container(

            //background image
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  images[index],
                ),
                fit: BoxFit.cover,
              )
            ),

            child: Container(
              margin: const EdgeInsets.only(top: 120, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  //page info
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: titles[index]),
                      AppText(text: subtitles[index], fontSize: 30,),

                      const SizedBox(height: 15,),
                      
                      SizedBox(
                        width: 250,
                        child: AppText(text: texts[index]),
                      ),

                      const SizedBox(height: 30,),

                      //'more' button
                      GestureDetector(
                        onTap: () {
                          context.read<AppCubits>().getData();
                        },
                        child: const SizedBox(
                          width: 200,
                          child: ResponsiveButton(
                            width: 120,
                          ),
                        ),
                      ),

                    ],
                  ),

                  //custom slider
                  Column(
                    children: List.generate(3, (sliderIndex) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 2),
                        width: 8,
                        height: index == sliderIndex ? 25 : 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: index == sliderIndex ? AppColors.mainColor
                              : AppColors.mainColor.withOpacity(.3),
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),


          );
        },
      ),
    );
  }
}
