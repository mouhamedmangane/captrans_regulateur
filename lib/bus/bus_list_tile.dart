

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
      subtitle: Text('${bus.nomGie} \\ ${bus.proprietaire!.nom} ',softWrap: true),
      trailing: Text('Ligne ${bus.numeroLigne}'),
      leading: CircleAvatar(
        //backgroundImage: ,
        backgroundColor: (bus.jourEtat! > 0 )?Colors.blue.shade700:Colors.red.shade700,
        foregroundColor: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text((bus.jourEtat! > 0 )?'+':'-',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
            Text('1${bus.jourEtat!.abs()}',textAlign: TextAlign.center,),
          ],
        ),
        radius: 25,
      ),
      onTap: (){
        if(onPressed != null)
          onPressed!(context,bus);
      },
    );
  }
}


