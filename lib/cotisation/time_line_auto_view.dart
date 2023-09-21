import 'package:captrans_regulateur/model/ligne_cotisation.dart';
import 'package:flutter/material.dart';
import 'package:noppal_util/date/npl_date_format.dart';
import 'package:noppal_util/format/number_helper.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../model/cotisation.dart';

class TimeLineAutoView extends StatelessWidget {
  final Cotisation cotisationAuto;
  final double lineXY;
  const TimeLineAutoView({required this.cotisationAuto,this.lineXY=0.3, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int nombre=0;

    return Column(
      children: cotisationAuto.ligneCotisations!.asMap().entries.map((e){
        nombre+=e.value.nombreDeDepot;
        return _item(e.value,nombre,isEnd:(cotisationAuto.ligneCotisations!.length-1)==e.key);
      }).toList(),
    );
  }

  Widget _item(LigneCotisation ligneCotisation,int nombre, {bool isEnd = false}){
    return TimelineTile(
      //beforeLineStyle: LineStyle(color: Colors.orange.shade300),
      //afterLineStyle: LineStyle(color: Colors.orange.shade300),
      //afterLineStyle: LineStyle(color: Colors.red),
      indicatorStyle:IndicatorStyle(
          indicatorXY: 0,
          indicator:Container(
            alignment: Alignment.center,
            width: 95,
            height: 50,
            decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey.shade100,
              border: Border.all(color:Colors.grey, width: 3),
            ) ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${ligneCotisation.nombreDeDepot} jours',style: const TextStyle(color:Colors.black,fontWeight: FontWeight.bold),),
                const SizedBox(height: 4,),
                Text("${NplDateFormat.dayFormat(ligneCotisation.dateDebut,separator: '-')}"),
                const SizedBox(height: 4,),
                Text("${NplDateFormat.dayFormat(ligneCotisation.dateFin,separator: '-')}"),
              ],
            ),
          )
          ,width: 105,height: 85,padding: EdgeInsets.zero),
      alignment: TimelineAlign.start,
      endChild: Container(
        padding: const EdgeInsets.only(left: 15,top: 0),
        alignment:Alignment.centerLeft,
        constraints: BoxConstraints(
          minHeight: isEnd?160:140,
        ),
        child: Row(
          children: [
            const SizedBox(width: 10,),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Cotisation automatique",style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 12,),
                  Wrap(
                    children: [
                      const Text('Total',style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(" : ${ligneCotisation.nombreDeDepot} jours x ${ligneCotisation.prixTotal()} f ",style: const TextStyle()),
                      Text("= ${NumberHelper.format(ligneCotisation.total!)} f",style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),
                  const SizedBox(height: 4,),
                  Text("P.Cap : ${NumberHelper.format(ligneCotisation.prixCaptrans)} f  --  P.Gie : ${NumberHelper.format(ligneCotisation.prixGie)} f  ",style: const TextStyle(fontStyle: FontStyle.italic)),

                  const SizedBox(height: 10,),
                  if(isEnd)...[
                    Text("Compte : ${NumberHelper.format(cotisationAuto.compte!)} fcfa",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 4,),
                    Text("Etat ${NumberHelper.format(cotisationAuto.jourEtat!)} jours, ${NumberHelper.format(cotisationAuto.montantEtat!)} fcfa",style: TextStyle(color: (cotisationAuto.jourEtat!<0)? Colors.red.shade500 : Colors.blue,fontWeight: FontWeight.bold)),

                  ]
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
