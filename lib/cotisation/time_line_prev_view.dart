import 'package:flutter/material.dart';
import 'package:noppal_util/date/npl_date_format.dart';
import 'package:noppal_util/format/number_helper.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../model_dto/cotisation_resume.dart';

class TimeLinePrevView extends StatelessWidget {
  final CotisationResume cotisationResume;
  final double lineXY;
  const TimeLinePrevView({required this.cotisationResume,this.lineXY=0.3, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isLast: true,
      //beforeLineStyle: LineStyle(color: Colors.orange.shade300),
      //afterLineStyle: LineStyle(color: Colors.orange.shade300),
      //afterLineStyle: LineStyle(color: Colors.red),

      indicatorStyle:IndicatorStyle(
        indicatorXY: 0,
          indicator:Container(
            alignment: Alignment.center,
            width: 150,
            height: 50,
            decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey.shade100,
              border: Border.all(color:Colors.grey, width: 3),
            ) ,
            child:  Text(NplDateFormat.dayFormat(cotisationResume.date,separator: '-'),style: const TextStyle(color:Colors.black),),
          )
          ,width: 105,height: 50,padding: EdgeInsets.zero),
      alignment: TimelineAlign.start,
      endChild: Container(
        padding: const EdgeInsets.only(left: 15,top: 0),
        alignment:Alignment.centerLeft,
        constraints: const BoxConstraints(
          minHeight: 120,
        ),
        child: Row(
          children: [
            const SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Cotisation précédente",style: TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 4,),
                Text("Date : ${NplDateFormat.dayFormat(cotisationResume.date,separator: '-')} à ${NplDateFormat.timeFormat(cotisationResume.date)}",style: TextStyle(fontStyle: FontStyle.italic),),
                const SizedBox(height: 12,),
                Text("Montant: ${NumberHelper.format(cotisationResume.montantVerser)} fcfa",style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 12,),
                Text("Compte : ${NumberHelper.format(cotisationResume.compte)} fcfa",style: const TextStyle(color: Colors.green,fontWeight: FontWeight.bold)),
                const SizedBox(height: 4,),
                Text("Etat ${NumberHelper.format(cotisationResume.jourEtat)} jours, ${NumberHelper.format(cotisationResume.montantEtat)} fcfa",style: TextStyle(color: (cotisationResume.jourEtat<0)? Colors.red.shade500 : Colors.blue,fontWeight: FontWeight.bold)),
                const SizedBox(width: 10,)
              ],
            ),
          ],
        ),
      ),

    );
  }
}
