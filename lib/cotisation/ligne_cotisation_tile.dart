import 'package:flutter/material.dart';
import 'package:noppal_util/date/npl_date_format.dart';
import 'package:noppal_util/format/number_helper.dart';
import '../model/ligne_cotisation.dart';

class LigneCotisationTile extends StatelessWidget {
  final LigneCotisation ligneCotisation;
  const LigneCotisationTile({required this.ligneCotisation,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style=TextStyle(color:Colors.grey.shade800,fontSize: 14);
    return ListTile(
      trailing: Text('${ligneCotisation.nombreDeDepot} j',),
      contentPadding: EdgeInsets.zero,
      // minLeadingWidth: 0,
      minVerticalPadding: 10,
      title:Text('${NumberHelper.format(ligneCotisation.total!)} FCFA',style: TextStyle(fontSize: 20,),),
      subtitle: Column(
        children: [
          SizedBox(height: 10,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Chip(label: Text('De : ${NplDateFormat.dayFormat(ligneCotisation.dateDebut!)}',style: style),),
              SizedBox(width: 5,),
              Chip(label: Text(' A : ${NplDateFormat.dayFormat(ligneCotisation.dateFin!)}',style: style,)),
            ],
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Chip(label:Text('P.Cap : ${NumberHelper.format(ligneCotisation.prixCaptrans)}',style: style,)),
              SizedBox(width: 5,),
              Chip(label :Text('P.Gie : ${NumberHelper.format(ligneCotisation.prixGie)}',style: style,)),
              SizedBox(width: 5,),
              Chip(label: Text('P.Sup : ${NumberHelper.format(ligneCotisation.prixCaptrans)}',style: style,)),
            ],
          ),
        ],
      ),
    );
  }
}
