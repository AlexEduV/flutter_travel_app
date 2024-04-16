import 'package:flutter/material.dart';

class exploreMoreItem extends StatelessWidget {
  const exploreMoreItem({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}
