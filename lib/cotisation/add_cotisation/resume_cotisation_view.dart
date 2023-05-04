import 'package:captrans_regulateur/bus/bus_resume.dart';
import 'package:captrans_regulateur/model/bus.dart';
import 'package:captrans_regulateur/model/receveur.dart';
import 'package:captrans_regulateur/receveur/receveur_resume.dart';
import 'package:flutter/material.dart';

class ResumeCotisationView extends StatelessWidget {
  final Bus bus;
  final Receveur ? receveur;

  const ResumeCotisationView({required this.bus,this.receveur,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
          width: double.infinity,
         // margin: EdgeInsets.only(bottom: 2,left: 2,right: 2),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color:Color.fromRGBO(246, 247, 248, 1.0),
            border: Border.all(color: Colors.blue,width: 1,),
            boxShadow: [
             // BoxShadow(color: Colors.black,blurRadius: 0.01),
            ],
            borderRadius: BorderRadius.circular(20) ,
          ),
          height:(receveur!=null) ? 190:95,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(receveur!=null)...[
                ReceveurResume(receveur: receveur!,),
                SizedBox(height: 7,),
                Divider(color: Colors.blue.shade300,),
                SizedBox(height: 7,),

              ],
              BusResume(bus),

            ],
          )
      ),
    );
  }
}
