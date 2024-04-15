import 'package:flutter/material.dart';

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

            child: Row(
              children: [

                //page info
                Column(
                  children: [

                  ],
                ),

                //slider state
                Column(
                  children: [

                  ],
                )
              ],
            ),


          );
        },
      ),
    );
  }
}
