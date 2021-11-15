import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {
  Color? color;
  double height;
  double horizontalPadding;

  HorizontalLine({this.color, this.height: 0.6, this.horizontalPadding = 16.0}) {
    this.color = color ?? Colors.black.withAlpha(56);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Container(
        height: height,
        color: color,
      ),
    );
  }
}
