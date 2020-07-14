import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final double radio;
  final List<Color> colors;

  const Circle({Key key, @required this.radio, @required this.colors}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: radio*2,
      height: radio*2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(this.radio),
        gradient: LinearGradient(
          colors: this.colors, begin: Alignment.topRight, end: Alignment.bottomLeft
        )
      ),
    );
  }
}
