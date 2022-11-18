import 'package:flutter/material.dart';

class Titre1 extends StatelessWidget {
  final String text;
  final Color ? color;
  const Titre1(this.text,{this.color,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        //decoration: TextDecoration.underline,
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: color,
      ),);
  }
}
