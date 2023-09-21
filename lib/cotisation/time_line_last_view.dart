import 'package:captrans_regulateur/model/ligne_cotisation.dart';
import 'package:flutter/material.dart';
import 'package:noppal_util/date/npl_date_format.dart';
import 'package:noppal_util/format/number_helper.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../model/cotisation.dart';

class TimeLineLastView extends StatelessWidget {
  final Cotisation cotisation;
  final double lineXY;
  final int nombreDeJour;
  const TimeLineLastView({required this.cotisation,this.lineXY=0.3,required this.nombreDeJour, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int nombre=nombreDeJour;
    if(cotisation.ligneCotisations==null) {
      return _last();
    } else if(cotisation.ligneCotisations!.isEmpty) {
      return _last();
    } else{
      return Column(
        children: (cotisation.ligneCotisations!=null)
            ? cotisation.ligneCotisations!.asMap().entries.map((e) {
          nombre+=e.value.nombreDeDepot;
          return _item(e.value,nombre,isEnd:(cotisation.ligneCotisations!.length-1)==e.key);
        }).toList()
            : [],
      );
    }

  }

  Widget _last(){
    return TimelineTile(
      isFirst: true,
      indicatorStyle:IndicatorStyle(
          indicatorXY: 0,
          indicator:Container(
            alignment: Alignment.center,
            width: 50,
            height: 50,
            decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey.shade100,
              border: Border.all(color: Colors.grey, width: 3),
            ) ,
            child: const Text('Depôt',style: TextStyle(color:Colors.black,)),
          )
          ,width: 105,height: 50,padding: EdgeInsets.zero),
      alignment: TimelineAlign.start,
      endChild: Container(
        padding: const EdgeInsets.only(left: 15,top: 0),
        alignment:Alignment.centerLeft,
        constraints:  const BoxConstraints(
          minHeight: 130,
        ),
        child: Row(
          children: [
            const SizedBox(width: 15,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Cotisation courante",style: TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 4,),
                Text("Date : ${NplDateFormat.dayFormat(cotisation.createdAt,separator: '-')} ${NplDateFormat.timeFormat(cotisation.createdAt)}",style:TextStyle(fontStyle: FontStyle.italic) ,),
                const SizedBox(height: 12,),
                Row(
                  children: [
                    Text('Montant : ',),
                    const SizedBox(height: 4,),
                    Text("${NumberHelper.format(cotisation.montant)} fcfa",style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
                const SizedBox(height: 10,),
                Text("Compte : ${NumberHelper.format(cotisation.compte!)} fcfa",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold)),
                const SizedBox(height: 4,),
                Text("Etat ${NumberHelper.format(cotisation.jourEtat!)} jours, ${NumberHelper.format(cotisation.montantEtat!)} fcfa",style: TextStyle(color: (cotisation.jourEtat!<0)? Colors.red .shade500: Colors.blue,fontWeight: FontWeight.bold)),

              ],
            ),
          ],
        ),
      ),

    );
  }

  Widget _item(LigneCotisation ligneCotisation, int nombre,{bool isEnd = false}){
    return TimelineTile(
      isFirst: isEnd,
      //beforeLineStyle: LineStyle(color: Colors.orange.shade300),
      //afterLineStyle: LineStyle(color: Colors.orange.shade300),
      //afterLineStyle: LineStyle(color: Colors.red),
      indicatorStyle:IndicatorStyle(
          indicatorXY: 0,
          indicator:Container(
            alignment: Alignment.center,
            width: 50,
            height: 50,
            decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey.shade100,
              border: Border.all(color: Colors.grey, width: 3),
            ) ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${ligneCotisation.nombreDeDepot} jours',style: const TextStyle(color:Colors.black,fontWeight: FontWeight.bold),),
                const SizedBox(height: 4,),
                if(ligneCotisation.nombreDeDepot>1)...[

                  Text("${NplDateFormat.dayFormat(ligneCotisation.dateDebut,separator: '-')}"),
                  const SizedBox(height: 4,),
                ],

                Text("${NplDateFormat.dayFormat(ligneCotisation.dateFin,separator: '-')}"),
              ],
            ),
          )
          ,width: 105,height: (nombre>1)?85:60,padding: EdgeInsets.zero),
      alignment: TimelineAlign.start,
      endChild: Container(

        padding: const EdgeInsets.only(left: 15,top: 0),
        alignment:Alignment.centerLeft,
        constraints:  BoxConstraints(
        minHeight: 165,
        ),
        child: Row(
          children: [
            const SizedBox(width: 10,),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Cotisation courante",style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 4,),
                  Text("Date : ${NplDateFormat.dayFormat(cotisation.createdAt,separator: '-')} ${NplDateFormat.timeFormat(cotisation.createdAt)}",style:TextStyle(fontStyle: FontStyle.italic) ,),
                  const SizedBox(height: 12,),
                  Wrap(
                    children: [
                      const Text('Total',style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(" : ${ligneCotisation.nombreDeDepot} jours x ${ligneCotisation.prixTotal()} f ",style: const TextStyle()),
                      Text("= ${NumberHelper.format(ligneCotisation.total!)} f",style: TextStyle(fontWeight: FontWeight.bold),)

                    ],
                  ),
                  const SizedBox(height: 4,),
                  Text("P.Cap : ${NumberHelper.format(ligneCotisation.prixCaptrans)} f  --  P.Gie ${NumberHelper.format(ligneCotisation.prixGie)} f ",style: const TextStyle(fontStyle: FontStyle.italic)),

                  const SizedBox(height: 10,),
                  if(isEnd)...[
                    Text("Compte : ${NumberHelper.format(cotisation.compte!)} fcfa",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4,),
                    Text("Etat ${NumberHelper.format(cotisation.jourEtat!)} jours, ${NumberHelper.format(cotisation.montantEtat!)} fcfa",style: TextStyle(color: (cotisation.jourEtat!<0)? Colors.red.shade500 : Colors.blue.shade500,fontWeight: FontWeight.bold)),
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
