import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  final Color color;
  final double size;
  const MyDivider({
    this.color=Colors.grey,
    this.size=0.9,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
        color: color,
    );
  }
}
