import 'package:captrans_regulateur/model/collect.dart';
import 'package:flutter/material.dart';
import 'package:noppal_util/date/npl_date_format.dart';
import 'package:noppal_util/format/number_helper.dart';

class ListeCollectItem extends StatelessWidget {
  final Collect collect;
  final Function(BuildContext,Collect) ? onSelect;
  final bool zeroContentPadding;
  const ListeCollectItem(this.collect,{this.onSelect,this.zeroContentPadding=false,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:(zeroContentPadding)?EdgeInsets.symmetric(horizontal: 0):null,
      //minLeadingWidth: 30,
      onTap: (){
        if(onSelect != null)
          onSelect!(context,collect);
      },
      leading: CircleAvatar(
        backgroundImage: Image.asset("asset/user/${collect.collecteur!.id}.jpeg").image,
        radius: 23,

      ),
      subtitle: Text(NplDateFormat.simpleFormat(collect.created_at!)),
      trailing: Text("${NumberHelper.format(collect.montant)} F",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
      title: Text(collect.collecteur!.nom) ,
    );
  }
}
