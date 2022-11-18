

import 'package:captrans_regulateur/model/receveur.dart';
import 'package:captrans_regulateur/receveur/receveur_list_tile.dart';
import 'package:flutter/material.dart';

class ReceveurHabituelList extends StatelessWidget {
  final List<Receveur> receveurs;
  final Function(BuildContext,Receveur) ? onPressed;
  const ReceveurHabituelList({required this.receveurs,this.onPressed,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: receveurs.map((receveur) => ReceveurListTile(receveur: receveur,onPressed: onPressed,)).toList(),
    );
  }
}
