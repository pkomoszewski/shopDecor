import 'package:flutter/material.dart';

class MainGradientContainer extends StatelessWidget {
  final width;
  final height;

  MainGradientContainer(this.height, this.width);

  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: width * .8,
        height: height / 2,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFFfbfcfd), Color(0xFFf2f3f8)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 1.0])),
      ),
    );
  }
}
