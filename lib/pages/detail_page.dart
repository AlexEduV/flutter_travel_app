import 'package:flutter/material.dart';
import 'package:flutter_travel_test/styles/colors.dart';
import 'package:flutter_travel_test/widgets/app_large_text.dart';
import 'package:gap/gap.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
                child: const Column(
                  children: [

                    Gap(20.0),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(text: 'Yosemite', color: Colors.black87,),
                        AppLargeText(text: '\$ 250', color: AppColors.mainColor,),
                      ],
                    ),

                   Gap(10.0),

                    Row(
                      children: [
                        
                      ],
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
