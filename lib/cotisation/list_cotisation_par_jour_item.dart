import 'package:captrans_regulateur/model/cotisation.dart';
import 'package:captrans_regulateur/model_dto/cotisation_global_info_jour_dto.dart';
import 'package:flutter/material.dart';
import 'package:noppal_util/date/npl_date_format.dart';
import 'package:noppal_util/format/number_helper.dart';

class ListeCotisationParJourItem extends StatelessWidget {
  final CotisationGlobalInfoJour cotisation;
  final Function (BuildContext,CotisationGlobalInfoJour)  ? onTap;
  const ListeCotisationParJourItem(this.cotisation,{this.onTap,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(

      contentPadding: EdgeInsets.only(left: 8,right: 8),

      onTap: (){
        if(onTap != null)
          onTap!(context,cotisation);
      },
      title: Text('${NumberHelper.format(cotisation.montant)} FCFA',style: TextStyle(fontWeight: FontWeight.bold),),
      subtitle: Text('${NumberHelper.format(cotisation.nombre)} cotisations'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${NplDateFormat.dayFormat(cotisation.jour,separator: '-')}',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14),),
        ],
      ),
    );
  }
}
