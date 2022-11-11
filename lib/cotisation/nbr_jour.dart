import 'package:flutter/material.dart';

class NbrJour extends StatelessWidget {
  final Widget child;
  final Color? color;
  const NbrJour({required this.child,this.color,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color!=null ? color:Theme.of(context).primaryColor,
      ),
      child: child,
    );
  }
}
