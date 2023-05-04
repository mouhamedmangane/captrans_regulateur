import 'package:captrans_regulateur/model/bus.dart';
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
        CircleAvatar(
          radius: 29,
          backgroundColor:Colors.blue,
          child:Icon(Icons.directions_bus,color: Color.fromRGBO(246, 247, 248, 1.0),size: 32,),

        ),
        SizedBox(width: 13,),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Row(
                children: [
                  Text('${bus.matricule} ',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
                  Expanded(child: Text(' - ${bus.proprietaire!.nom} ',style:TextStyle(fontSize: 14,color: Colors.black,),softWrap: true,overflow: TextOverflow.ellipsis,)),
                ],
              ),
              SizedBox(height: 2,),
              nbreJourWidget()
            ],
          ),
        ),
      ],
    );


  }
  Widget nbreJourWidget(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _subrillance(" ${NumberHelper.format(bus.jourEtat!.abs())} jours ",(bus.jourEtat!<0)?Colors.red.shade600:Colors.blue,Colors.white),

        if(bus.jourEtat!<0)...[
          SizedBox(width: 10,),
          _subrillance(' ${NumberHelper.format((bus.compte ?? 0) + bus.montantEtat!)} FCFA', Colors.red.shade600, Colors.white),
        ]
      ],
    );
  }

  Widget _subrillance(String text,Color backColor,Color foreColor){
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: backColor,
            borderRadius: BorderRadius.circular(8)
        ),
        child: Text(text,style: TextStyle(fontSize: 18,color:foreColor,))
    );
  }

}
