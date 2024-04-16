import 'package:flutter/material.dart';
import 'package:flutter_travel_test/widgets/app_large_text.dart';

class HomeItemPage extends StatefulWidget {
  const HomeItemPage({super.key});

  @override
  State<HomeItemPage> createState() => _HomeItemPageState();
}

class _HomeItemPageState extends State<HomeItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //top bar
            Row(
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

            const SizedBox(height: 40,),

            //discover text
            const AppLargeText(text: 'Discover'),

            const SizedBox(height: 30,),

            const DefaultTabController(
              length: 3,
              child: TabBar(
                tabs: [
                  Tab(text: "Places",),
                  Tab(text: "Inspiration",),
                  Tab(text: "Emotions",),
                ],
              ),
            ),

            //Container(),

          ],
        ),
      ),
    );
  }
}

