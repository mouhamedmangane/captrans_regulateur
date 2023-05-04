

import 'package:captrans_regulateur/bus/liste_bus_item.dart';
import 'package:captrans_regulateur/model/bus.dart';
import 'package:captrans_regulateur/modelDataTest/bus_data.dart';
import 'package:flutter/material.dart';

class ListeBus extends StatelessWidget {
  final List<Bus> buss=BusData(10).getData();
  ListeBus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
              (BuildContext context,int index){
            return ListeBusItem(buss[index]);
          },
          childCount: buss.length,
        )
    );
  }
}
