import 'package:captrans_regulateur/model/bus.dart';
import 'package:flutter/material.dart';
import 'package:noppal_util/date/npl_date_format.dart';

class ListeBusItem extends StatelessWidget {
  final Bus bus;
  const ListeBusItem(this.bus,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 0,right: 0),
      leading: CircleAvatar(
        child: Text(bus.jourEtat.toString(),style: TextStyle(fontWeight: FontWeight.w500),),
        foregroundColor: (bus.jourEtat! < 0)?Colors.red:Colors.blue,
        backgroundColor: Colors.white,
        radius: 30,

      ),
      title: Text(bus.matricule!,style: TextStyle(fontWeight: FontWeight.w400),),
      subtitle: Text(bus.proprietaire!.nom),
      trailing:Text(NplDateFormat.simpleFormat(bus.lastDateCotisation!),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
    );;
  }
}
