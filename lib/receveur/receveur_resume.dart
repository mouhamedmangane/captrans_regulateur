

import 'package:captrans_regulateur/model/receveur.dart';
import 'package:flutter/material.dart';

class ReceveurResume extends StatelessWidget {
  final Receveur receveur;
  const ReceveurResume({required this.receveur,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: Image.asset('asset/user/${receveur.id+1}.jpeg').image,
        ),
        SizedBox(width: 15,),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('${receveur.nom} ',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue)),
                Text(' ( ${receveur.tel!} )',style:TextStyle(fontSize: 16,color: Colors.blue)),
              ],
            ),
            SizedBox(height: 2,),
            _subrillance("Receveur", Colors.green.shade100,Colors.black),
          ],
        ),
      ],
    );
  }

    Widget _subrillance(String text,Color backColor,Color foreColor){
      return Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
            color: backColor,
            borderRadius: BorderRadius.circular(4)
            ),
            child: Text(text,style: TextStyle(fontSize: 16,color:foreColor,))
            );
    }


}
