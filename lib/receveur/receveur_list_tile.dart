

import 'package:captrans_regulateur/model/receveur.dart';
import 'package:captrans_regulateur/ui/avatar/circle_cached_avatar.dart';
import 'package:flutter/material.dart';

class ReceveurListTile extends StatelessWidget {
  final Receveur receveur;
  final Function(BuildContext,Receveur) ? onPressed;
  const ReceveurListTile({required this.receveur,this.onPressed=null,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(receveur.nom),
      subtitle: Text(receveur.tel),
      leading: CircleCachedAvatar(
        urlDistant: ''

      ),
      onTap: (){
        if(onPressed != null)
          onPressed!(context,receveur);
      },
    );
  }
}


