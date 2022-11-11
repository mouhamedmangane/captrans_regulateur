

import 'package:captrans_regulateur/model/receveur.dart';
import 'package:flutter/material.dart';

class ReceveurListTile extends StatelessWidget {
  final Receveur receveur;
  final Function() ? onPressed;
  const ReceveurListTile({required this.receveur,this.onPressed=null,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(receveur.nom),
      subtitle: Text(receveur.tel),
      leading: CircleAvatar(
        backgroundImage: Image.asset('asset/user/${receveur.id+1}.jpeg').image,
        radius: 28,
      ),
      onTap: onPressed,
    );
  }
}


