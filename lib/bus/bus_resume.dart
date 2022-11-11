import 'package:captrans_regulateur/model/bus.dart';
import 'package:captrans_regulateur/modelDataTest/collect_data.dart';
import 'package:flutter/material.dart';
import 'package:noppal_util/format/number_helper.dart';

class BusResume extends StatelessWidget {
  final Bus bus;
  const BusResume(this.bus,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.bus_alert,color: Colors.blue,size: 35,),
        SizedBox(width: 13,),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('${bus.matricule}'!,style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue)),
                Text(' (${bus.proprietaire!.nom!})',style:TextStyle(fontSize: 16,color: Colors.blue)),
              ],
            ),
            SizedBox(height: 2,),
            nbreJourWidget()
          ],
        ),
      ],
    );


  }
  Widget nbreJourWidget(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _subrillance("${bus.jourEtat!.abs()} jours ",(bus.jourEtat!<0)?Colors.red.shade100:Colors.green.shade100,Colors.black),

        if(bus.jourEtat!<0)...[
          SizedBox(width: 10,),
          Text('${NumberHelper.format(bus.compte)} FCFA',style: TextStyle(fontSize: 14),),
        ]
      ],
    );
  }

  Widget _subrillance(String text,Color backColor,Color foreColor){
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: backColor,
            borderRadius: BorderRadius.circular(4)
        ),
        child: Text(text,style: TextStyle(fontSize: 16,color:foreColor,))
    );
  }

}
