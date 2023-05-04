

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
          radius: 30,
          backgroundColor: Colors.blue,
          child: Icon(Icons.person,size: 32,color: Colors.white,),
        ),
        SizedBox(width: 15,),
        Flexible(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${receveur.nom} ',style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
                  const SizedBox(height: 2,),
                  _subrillance(" Receveur ", Colors.blue,Colors.white),
                ],
              ),
              Flexible(child: Text(' - ${receveur.tel} ',style:TextStyle(fontSize: 16,color: Colors.black,),)),

            ],
          ),
        ),
      ],
    );
  }

    Widget _subrillance(String text,Color backColor,Color foreColor){
      return Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
            color: backColor,
            borderRadius: BorderRadius.circular(8)
            ),
            child: Text(text,style: TextStyle(fontSize: 18,color:foreColor,))
            );
    }


}
