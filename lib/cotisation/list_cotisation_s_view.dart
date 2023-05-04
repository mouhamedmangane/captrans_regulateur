import 'package:captrans_regulateur/cotisation/list_cotisation_s_item_view.dart';
import 'package:captrans_regulateur/model/cotisation.dart';
import 'package:flutter/material.dart';

class ListeCotisationSView extends StatelessWidget {
  final List<Cotisation> cotisations;
  final Function(BuildContext,Cotisation ? cotisation)? onTap;

  const ListeCotisationSView({this.onTap, required this.cotisations,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SliverFixedExtentList(
        itemExtent: 60,
        delegate: SliverChildBuilderDelegate(
              (BuildContext context,int index){
            return ListeCotisationSItemView(
                onTap:onTap,
                cotisations[index]
            );
          },
          childCount: cotisations.length,

        )
    );
  }
}
