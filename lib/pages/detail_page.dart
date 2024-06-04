import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_test/cubit/app_cubits.dart';
import 'package:flutter_travel_test/styles/colors.dart';
import 'package:flutter_travel_test/widgets/app_button.dart';
import 'package:flutter_travel_test/widgets/app_large_text.dart';
import 'package:flutter_travel_test/widgets/app_text.dart';
import 'package:flutter_travel_test/widgets/responsive_button.dart';
import 'package:gap/gap.dart';

import 'package:flutter_travel_test/cubit/app_cubit_states.dart';
import 'package:flutter_travel_test/model/data_model.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  late int selectedPeopleIndex = -1;

  void onBackPressed() {
    context.read<AppCubits>().goHome();
  }

  @override
  Widget build(BuildContext context) {

    return PopScope(
      onPopInvoked: (bool isInvoked) {
        onBackPressed();
      },
      canPop: false,
      child: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {

          DetailState detailState = state as DetailState;
          DataModel place = detailState.place;

          return Scaffold(
            body: SizedBox(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Stack(
                children: [

                  //background image
                  Positioned(
                      child: Container(
                        height: 350,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('http://mark.bslmeiyu.com/uploads/${place.imgSource}',),
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
                        //back button
                        IconButton(
                          onPressed: () {
                            onBackPressed();
                          },
                          icon: const Icon(
                            Icons.chevron_left,
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
                    top: 300,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
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

                          const Gap(25.0),

                          //name and price
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppLargeText(
                                text: place.name,
                                color: Colors.black87,
                                fontSize: 28,
                              ),

                              AppLargeText(
                                text: '\$ ${place.price}',
                                color: AppColors.mainColor,
                                fontSize: 28,
                              ),
                            ],
                          ),

                         const Gap(10.0),

                          //location (icon and text)
                          Row(
                            children: [
                              const Icon(Icons.location_pin, color: AppColors.mainColor,),

                              const Gap(5.0),

                              AppText(
                                text: place.location,
                                color: AppColors.mainColor,
                                fontSize: 14.0,
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
                                      index < place.stars ? Icons.star: Icons.star_border,
                                      color: index < place.stars ? AppColors.starColor : AppColors.textColor2,
                                    );
                                  })
                              ),

                              const Gap(10.0),

                              AppText(
                                text: '(${place.stars}.0)',
                                color: AppColors.textColor2,
                              ),
                            ],
                          ),

                          const Gap(35.0),

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

                          const Gap(10.0),

                          Wrap(
                            spacing: 8.0,
                            children: List.generate(5, (index) {

                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedPeopleIndex = index;
                                  });
                                },
                                child: AppButton(
                                  text: '${index + 1}',
                                  backgroundColor: index == selectedPeopleIndex ? Colors.black87 : AppColors.buttonBackgroundColor,
                                  color: index == selectedPeopleIndex ? AppColors.buttonBackgroundColor : Colors.black87,
                                  borderColor: index == selectedPeopleIndex ? Colors.black87 : AppColors.buttonBackgroundColor,
                                  size: 55,
                                ),
                              );

                            }),
                          ),

                          const Gap(35.0),

                          const AppLargeText(text: 'Description', fontSize: 20,),

                          const Gap(5.0),

                          AppText(
                            text: place.description,
                            color: AppColors.mainTextColor,
                          ),

                          const Gap(20.0),

                          const Row(
                            children: [

                              AppButton(
                                backgroundColor: Colors.white,
                                color: Colors.black87,
                                borderColor: Colors.black87,
                                icon: CupertinoIcons.heart,
                              ),

                              Gap(10.0),

                              Expanded(
                                child: ResponsiveButton(
                                  text: 'Book Trip Now',
                                ),
                              ),

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
      ),
    );
  }
}
