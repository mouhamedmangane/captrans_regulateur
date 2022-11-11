import 'package:captrans_regulateur/model/cotisation.dart';
import 'package:flutter/material.dart';

class ListeCotisationItem extends StatelessWidget {
  final Cotisation cotisation;
  const ListeCotisationItem(this.cotisation,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 0,right: 0),
      leading: CircleAvatar(
        child: Text((cotisation.bus!.jourEtat!).abs().toString(),style: TextStyle(fontWeight: FontWeight.w500),),
        foregroundColor: (cotisation.bus!.jourEtat! < 0)?Colors.red:Colors.blue,
        backgroundColor: Colors.white,
        radius: 30,

      ),
      title: Text(cotisation.bus!.matricule!,style: TextStyle(fontWeight: FontWeight.w400),),
      subtitle: Text(cotisation.bus!.proprietaire!.nom),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(cotisation.montant!.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          Text(" F ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18))
        ],
      ),
    );
  }
}
