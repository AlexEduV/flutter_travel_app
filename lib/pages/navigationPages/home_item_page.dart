import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_travel_test/styles/colors.dart';
import 'package:flutter_travel_test/widgets/app_large_text.dart';
import 'package:flutter_travel_test/widgets/app_text.dart';

class HomeItemPage extends StatefulWidget {
  const HomeItemPage({super.key});

  @override
  State<HomeItemPage> createState() => _HomeItemPageState();
}

class _HomeItemPageState extends State<HomeItemPage> {

  int selectedTabPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                  const Icon(Icons.menu, size: 30, color: Colors.black,),

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

            const SizedBox(height: 40,),

            //discover text
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const AppLargeText(text: 'Discover'),
            ),

            const SizedBox(height: 30,),

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
              child: getTabPageByIndex(selectedTabPageIndex),
            ),

            //Explore More section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //explore more text
                  AppLargeText(text: "Explore More", textSize: 18,),

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

                    return Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          margin: const EdgeInsets.only(right: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.5),
                            borderRadius: BorderRadius.circular(16.0),

                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }

  Widget getTabPageByIndex(int index)
  {

    if (index == 0) {

      return ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 20.0, top: 15.0, bottom: 15.0,),
        itemBuilder: (BuildContext context, int index) {

          return Container(
            height: 300,
            width: 200,
            margin: const EdgeInsets.only(right: 10.0,),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                image: const DecorationImage(
                  image: AssetImage(
                    "assets/images/mountain.jpeg",
                  ),
                  fit: BoxFit.cover,
                )
            ),
          );
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

