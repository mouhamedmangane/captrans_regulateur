import 'package:flutter/material.dart';

class MyGenericAppBar extends StatelessWidget {
  final String titre;
  const MyGenericAppBar(this.titre,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.black,
      backgroundColor: Colors.grey.shade200,
      centerTitle: true,
      title: Text(titre),
      elevation:0,
    );
  }
}
