

import 'package:captrans_regulateur/model/bus.dart';
import 'package:flutter/material.dart';

class BusListTile extends StatelessWidget {
  final Bus bus;
  final Function(BuildContext,Bus) ? onPressed;
  const BusListTile({required this.bus,this.onPressed=null,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(bus.matricule),
      minVerticalPadding: 10,
      subtitle: Text('${bus.nomGie} \\ ${bus.proprietaire!.nom} ',softWrap: true),
      trailing: Text('Ligne ${bus.numeroLigne}'),
      leading:Container(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: (bus.jourEtat! >= 0 )?Colors.blue.shade700:Colors.red.shade700,
          borderRadius: BorderRadius.circular(10)
        ),
        //backgroundImage: ,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text((bus.jourEtat! >= 0 )?'+':'-',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.white),),
            Text('${bus.jourEtat!.abs()}',style:TextStyle(color: Colors.white),textAlign: TextAlign.center,),
          ],
        ),
      ),
      onTap: (){
        if(onPressed != null)
          onPressed!(context,bus);
      },
    );
  }
}


