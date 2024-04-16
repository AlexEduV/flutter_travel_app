import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  final String imageSource;

  const CarouselItem({
    super.key,
    required this.imageSource,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 200,
      margin: const EdgeInsets.only(right: 10.0,),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(
              imageSource
            ),
            fit: BoxFit.cover,
          )
      ),
    );
  }
}
