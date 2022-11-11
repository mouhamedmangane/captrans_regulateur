import 'package:captrans_regulateur/appbar/my_sliver_app.dart';
import 'package:captrans_regulateur/collect/liste_collect.dart';
import 'package:flutter/material.dart';

class CollectBody extends StatelessWidget {
  const CollectBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomScrollView(
        slivers: [
          MySliverApp("Collectes",actions: [
            IconButton(
                onPressed: (){
                },
                color: Colors.green,

                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(0),
                icon: Icon(Icons.qr_code_outlined,color: Colors.blue,)
            ),
          ],),
          ListeCollect(),
        ],
      ),
    );
  }
}
