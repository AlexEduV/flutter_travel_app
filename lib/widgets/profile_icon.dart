import 'package:flutter/material.dart';

class ProfileIcon extends StatelessWidget {
  final String assetSrc;

  const ProfileIcon({
    required this.assetSrc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(assetSrc),
        ),
        borderRadius: BorderRadius.circular(10),
        color: Colors.indigo,
      ),
    );
  }
}
