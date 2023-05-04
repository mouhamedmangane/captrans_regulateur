import 'package:captrans_regulateur/cotisation/ligne_cotisation_tile.dart';
import 'package:flutter/material.dart';
import '../model/cotisation.dart';

class CotiationParamView extends StatelessWidget {
  final Cotisation cotisation;
  const CotiationParamView({required this.cotisation,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10,bottom: 15,left: 15),
            child: Text('Details Cotisations'),
          ),
          // MyDivider(color: Colors.grey.shade200),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),

            child: Column(
              children: ListTile.divideTiles(
                context: context ,
                tiles:cotisation.ligneCotisations!.map((e) => LigneCotisationTile(ligneCotisation: e,)).toList(),
              ).toList(),
            ),
          )
        ],
      ) ,
    );
  }

}
