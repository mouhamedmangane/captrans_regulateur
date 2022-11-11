import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final String titre;
  const MyAppBar(this.titre,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titre,style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.w500),),
                SizedBox(height: 5,),
                Text("Ven 09 sept 2022",style: TextStyle(fontSize: 14,color: Theme.of(context).hintColor)),
              ],
            ),
          ),


    );
  }
}
