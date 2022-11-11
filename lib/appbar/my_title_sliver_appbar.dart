import 'package:flutter/material.dart';

class MyTitleSliverAppBar extends StatelessWidget {
  final Widget ?leading;
  final List<Widget> ? actions;
  final String titre;
  const MyTitleSliverAppBar(this.titre,{this.leading,this.actions,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: leading,
      elevation: 1,
      backgroundColor: Colors.grey.shade200,
      foregroundColor: Colors.black,
      floating: false,
      automaticallyImplyLeading: true,
      pinned: true,
      title: Text(titre),
      actions:actions

      //UserAvatarButton(),

    );
  }
}
