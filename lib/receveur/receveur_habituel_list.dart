

import 'package:captrans_regulateur/model/receveur.dart';
import 'package:captrans_regulateur/receveur/receveur_list_tile.dart';
import 'package:flutter/material.dart';

class ReceveurHabituelList extends StatelessWidget {
  final List<Receveur> receveurs;
  const ReceveurHabituelList({required this.receveurs,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: receveurs.map((receveur) => ReceveurListTile(receveur: receveur)).toList(),
    );
  }
}
