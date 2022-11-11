import 'package:captrans_regulateur/collect/liste_collect_item.dart';
import 'package:captrans_regulateur/model/collect.dart';
import 'package:captrans_regulateur/modelDataTest/collect_data.dart';
import 'package:flutter/material.dart';

class ListeCollect extends StatelessWidget {
  List<Collect> collects=CollectData(10).getData();
  ListeCollect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SliverList(
        delegate: SliverChildBuilderDelegate(
              (BuildContext context,int index){
            return ListeCollectItem(collects[index]);
          },
          childCount: collects.length,
        )
    );
  }
}
