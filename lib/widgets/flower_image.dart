import 'package:flutter/material.dart';

class FlowerImage extends StatelessWidget {
  const FlowerImage({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.sizeOf(context).width;

    return Image.asset(
      'assets/flower.png',
      width: deviceWidth * 0.3,
    );
  }
}
