import 'package:captrans_regulateur/cotisation/ListCotisationItem.dart';
import 'package:captrans_regulateur/model/bus.dart';
import 'package:captrans_regulateur/model/cotisation.dart';
import 'package:captrans_regulateur/modelDataTest/cotisation_data.dart';
import 'package:flutter/material.dart';

class ListeCotisation extends StatelessWidget {
  List<Cotisation> cotisations=CotisationData(10).getData();
  ListeCotisation({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context,int index){
            return ListeCotisationItem(cotisations[index]);
          },
          childCount: cotisations.length,
        )
    );
  }
}