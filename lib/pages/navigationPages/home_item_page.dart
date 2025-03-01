import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_test/cubit/app_cubit_states.dart';
import 'package:flutter_travel_test/cubit/app_cubits.dart';
import 'package:flutter_travel_test/theme/colors.dart';
import 'package:flutter_travel_test/widgets/app_large_text.dart';
import 'package:flutter_travel_test/widgets/app_text.dart';
import 'package:flutter_travel_test/widgets/carousel_item.dart';
import 'package:flutter_travel_test/widgets/explore_more_item.dart';

import 'package:flutter_travel_test/models/data_model.dart';
import 'package:flutter_travel_test/widgets/profile_icon.dart';
import 'package:gap/gap.dart';

class HomeItemPage extends StatefulWidget {
  const HomeItemPage({super.key});

  @override
  State<HomeItemPage> createState() => _HomeItemPageState();
}

class _HomeItemPageState extends State<HomeItemPage> {

  int selectedTabPageIndex = 0;
  final exploreMoreItemsImages = {
    "ballooning.png": "Ballooning",
    "hiking.png": "Hiking",
    "kayaking.png" : "Kayaking",
    "snorkeling.png" : "Snorkeling",
  };

  void onBackPressed() {
    context.read<AppCubits>().goToWelcomePage();
  }

  @override
  Widget build(BuildContext context) {

    return PopScope(
      onPopInvoked: (bool isInvoked) {
        onBackPressed();
      },
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<AppCubits, CubitStates>(
          builder: (context, state) {

            if (state is LoadedState) {

              List<DataModel> info = state.places;

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Gap(50.0),

                    //top bar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          //menu icon
                          IconButton(
                            icon: const Icon(Icons.chevron_left, size: 30, color: Colors.black,),
                            onPressed: () {
                              onBackPressed();
                            },
                          ),

                          //profile image (placeholder)
                          const ProfileIcon(
                            assetSrc: 'assets/images/moon-profile.png',
                          ),

                        ],
                      ),
                    ),

                    const Gap(30.0),

                    //discover text
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: AppLargeText(text: 'Discover'),
                    ),

                    const Gap(20.0),

                    //tab bar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: DefaultTabController(
                        length: 3,
                        child: TabBar(
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey.withOpacity(.5),
                          tabAlignment: TabAlignment.start,
                          labelPadding: const EdgeInsets.only(left: 0.0, right: 20,),
                          dividerColor: Colors.transparent,
                          isScrollable: true,
                          indicator: const CircleTabIndicator(
                            color: AppColors.mainColor,
                            radius: 3.0,
                          ),
                          onTap: (index) {
                            setState(() {
                              selectedTabPageIndex = index;
                            });
                          },
                          tabs: const [
                            Tab(text: "Places",),
                            Tab(text: "Inspiration",),
                            Tab(text: "Emotions",),
                          ],
                        ),
                      ),
                    ),

                    //images carousel
                    SizedBox(
                      height: 300,
                      width: double.maxFinite,
                      child: getTabPageByIndex(selectedTabPageIndex, info),
                    ),

                    //Explore More section
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //explore more text
                          AppLargeText(text: "Explore More", fontSize: 18,),

                          //see all button
                          AppText(text: "See All", color: AppColors.mainColor,),
                        ],
                      ),
                    ),

                    //Explore More items
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Wrap(
                        spacing: 20,
                        children: List.generate(4, (index) {

                          return ExploreMoreItem(
                            imageSource: 'assets/images/${exploreMoreItemsImages.keys.elementAt(index)}',
                            label: exploreMoreItemsImages.values.elementAt(index),
                          );

                        }),
                      ),
                    ),



                  ],
                ),
              );
            }
            else {
              return const SizedBox.shrink();
            }

          },
        )
      ),
    );
  }

  Widget getTabPageByIndex(int index, List<DataModel> data) {

    if (index == 0) {

      return ListView.separated(
        itemCount: data.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 20.0, top: 15.0, bottom: 15.0,),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              context.read<AppCubits>().showDetails(data[index]);
            },
            child: CarouselItem(
              imageSource: "http://mark.bslmeiyu.com/uploads/${data[index].imgSource}",
              name: data[index].name,
              location: data[index].location,
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Gap(10.0);
        },
      );

    }
    else if (index == 1) {
      return const Text('Inspiration');
    }
    else if (index == 2) {
      return const Text('Emotions');
    }

    return const SizedBox.shrink();
  }
}

class CircleTabIndicator extends Decoration {

  final Color color;
  final double radius;

  const CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
  
}

class _CirclePainter extends BoxPainter {

  final Color color;
  final double radius;

  const _CirclePainter({required this.color, required this.radius});
  
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {

    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - (radius * 2));

    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
  
}

