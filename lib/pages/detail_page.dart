import 'package:flutter/material.dart';

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
                      //color: Colors.white,
                    ),
                  ),

                  //more button
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(
                      Icons.more_vert,
                      //color: Colors.white,
                    ),
                  ),

                ],
              ),
            ),

            

          ],
        ),
      ),
    );
  }
}
