import 'package:captrans_regulateur/model/collect.dart';
import 'package:flutter/material.dart';
import 'package:noppal_util/date/npl_date_format.dart';

class ListeCollectItem extends StatelessWidget {
  final Collect collect;
  const ListeCollectItem(this.collect,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
      minLeadingWidth: 30,

      leading: CircleAvatar(
        backgroundImage: Image.asset("asset/user/${collect.collecteur!.id}.jpeg").image,
        radius: 30,

      ),
      subtitle: Text(NplDateFormat.simpleFormat(collect.created_at!)),
      trailing: Text("${collect.montant!} F",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
      title: Text(collect.collecteur!.nom!) ,
    );
  }
}
