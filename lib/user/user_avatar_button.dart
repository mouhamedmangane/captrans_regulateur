import 'dart:ffi';

import 'package:flutter/material.dart';

class UserAvatarButton extends StatelessWidget {
  const UserAvatarButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        shape: CircleBorder(
          side: BorderSide(width: 2,color: Colors.blue),
        ),
        padding: EdgeInsets.all(4),
        minWidth: 0,
        height: 0,
        onPressed: (){

        },
        child: CircleAvatar(

          backgroundImage: Image.asset("asset/user/profil.png").image,

        )
    );
  }
}
