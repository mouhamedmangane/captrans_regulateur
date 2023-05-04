

import 'package:flutter/material.dart';

import '../model/bus.dart';
import '../ui/listitem/cle_valeur_view.dart';

class BusParamView extends StatelessWidget {
  final Bus  bus;
  const BusParamView({required this.bus,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            trailing:Text(' ${bus.matricule}  ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)) ,
            title: Text('Matricule Bus'),
            leading: Icon(Icons.departure_board,),
          ),

          CleValeurView(
            cle: Text('Proprietaire Bus'),
            valeur: Text('${bus.proprietaire!.nom}',),
            icon: Icons.personal_injury,
          ),

          CleValeurView(
            cle: Text('Gie'),
            valeur:Text('${bus.nomGie} '),
            icon: Icons.group_work,
          ),
          CleValeurView(
            cle: Text('Numero ligne'),
            valeur:Text('${bus.numeroLigne}',),
            icon: Icons.line_axis,
          ),

        ],
      ),
    );
  }
}
