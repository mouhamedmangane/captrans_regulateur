

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
      subtitle: Row(
        children: [
          Text('${bus.nomGie}'),
          Text('${bus.proprietaire!.nom}'),
        ],
      ),
      trailing: Text('Ligne ${bus.numeroLigne}'),
      leading: CircleAvatar(
        //backgroundImage: ,
        child: Text('L ${bus.numeroLigne}',textAlign: TextAlign.center,),
        radius: 25,
      ),
      onTap: (){
        if(onPressed != null)
          onPressed!(context,bus);
      },
    );
  }
}


