import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_test/cubit/app_cubit_states.dart';
import 'package:flutter_travel_test/cubit/app_cubits.dart';
import 'package:flutter_travel_test/styles/colors.dart';
import 'package:flutter_travel_test/widgets/app_large_text.dart';
import 'package:flutter_travel_test/widgets/app_text.dart';
import 'package:flutter_travel_test/widgets/carousel_item.dart';
import 'package:flutter_travel_test/widgets/explore_more_item.dart';

import 'package:flutter_travel_test/model/data_model.dart';
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
        body: BlocBuilder<AppCubits, CubitStates>(
          builder: (context, state) {

            if (state is LoadedState) {

              List<DataModel> info = state.places;

              return Container(
                padding: const EdgeInsets.only(top: 50,),
                color: Colors.white,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    //top bar
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/images/moon-profile.png'),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.indigo,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30,),

                    //discover text
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const AppLargeText(text: 'Discover'),
                    ),

                    const SizedBox(height: 20,),

                    //tab bar
                    Container(
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
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //explore more text
                          AppLargeText(text: "Explore More", fontSize: 18,),

                          //see all button
                          AppText(text: "See All", color: AppColors.mainColor,),
                        ],
                      ),
                    ),

                    //
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) {

                            return Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: exploreMoreItem(
                                imageSource: 'assets/images/${exploreMoreItemsImages.keys.elementAt(index)}',
                                label: exploreMoreItemsImages.values.elementAt(index),
                              ),
                            );
                          },
                        ),
                      ),
                    ),



                  ],
                ),
              );
            }
            else {
              return Container();
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

    return Container();
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

