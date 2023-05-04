import 'package:captrans_regulateur/appbar/myappbar.dart';
import 'package:captrans_regulateur/user/user_avatar_button.dart';
import 'package:flutter/material.dart';

class MySimpleAppBar extends StatelessWidget {
  final String titre;
  const MySimpleAppBar(this.titre,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
            MyAppBar(titre),
            const Spacer(),
            const UserAvatarButton(),
          ],
        )
    ;
  }
}
