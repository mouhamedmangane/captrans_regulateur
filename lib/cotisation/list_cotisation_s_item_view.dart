import 'package:captrans_regulateur/model/cotisation.dart';
import 'package:flutter/material.dart';
import 'package:noppal_util/format/number_helper.dart';

class ListeCotisationSItemView extends StatelessWidget {
  final Cotisation cotisation;
  final Function(BuildContext,Cotisation) ? onTap;
  const ListeCotisationSItemView(this.cotisation,{this.onTap,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 0,right: 0),
      onTap: (){
        if(onTap != null)
          onTap!(context,cotisation);
      },
      title: Text(cotisation.bus!.matricule),
      subtitle: Text(cotisation.bus!.proprietaire!.nom),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${NumberHelper.format(cotisation.montant)}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
          Text(" F ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16))
        ],
      ),
    );
  }
}
