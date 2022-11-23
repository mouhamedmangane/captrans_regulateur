import 'package:captrans_regulateur/collect/liste_collect_item.dart';
import 'package:captrans_regulateur/model/collect.dart';
import 'package:captrans_regulateur/modelDataTest/collect_data.dart';
import 'package:flutter/material.dart';

class ListeCollect extends StatelessWidget {


  List<Collect> collects=CollectData(10).getData();
  Function(BuildContext,Collect) ? onSelect;
  final bool zeroContentPadding;

  ListeCollect({this.onSelect,this.zeroContentPadding=false, Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemBuilder: (BuildContext context,int index){
            return ListeCollectItem(
              collects[index],
              onSelect:onSelect,
              zeroContentPadding: zeroContentPadding,
            );
        },
        itemCount: collects.length,
    );
  }
}
