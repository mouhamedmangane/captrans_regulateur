import 'package:captrans_regulateur/model/cotisation.dart';
import 'package:flutter/material.dart';
import 'package:noppal_util/date/npl_date_format.dart';
import 'package:noppal_util/format/number_helper.dart';

class ListeCotisationBItemView extends StatelessWidget {
  final Cotisation cotisation;
  final Function(BuildContext,Cotisation) ? onTap;
  const ListeCotisationBItemView(this.cotisation,{this.onTap,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        if(onTap != null)
          onTap!(context,cotisation);
      },
      leading: CircleAvatar(
        radius: 28,
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('1${cotisation.dateFin.difference(cotisation.dateDebut).inDays}',style: TextStyle(fontSize: 14,fontWeight:FontWeight.bold)),
            Text('jours',style: TextStyle(fontSize: 12),),
          ],
        ),
      ),
      title: Text('${cotisation.receveur!.nom} '),
      subtitle: Text('[ ${NplDateFormat.dayFormat(cotisation.dateDebut,separator: '-')} , ${NplDateFormat.dayFormat(cotisation.dateFin,separator: '-')} ]'),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Chip(

             labelPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
            backgroundColor: Colors.blue,
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${NumberHelper.format(cotisation.montant??0)}',style: TextStyle(color: Colors.white),),
                Text(" F",style: TextStyle(color: Colors.white))
              ],
            ),
          ),
          //Text('le ${NplDateFormat.dayFormat(cotisation.created_at!,separator: '-')}',style: TextStyle(fontSize: 12,),),

        ],
      ),
    );
  }
}
