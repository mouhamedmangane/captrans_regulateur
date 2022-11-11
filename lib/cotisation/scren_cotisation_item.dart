


import 'package:captrans_regulateur/cotisation/nbr_jour.dart';
import 'package:captrans_regulateur/model/cotisation.dart';
import 'package:flutter/material.dart';
import 'package:noppal_util/date/npl_date_format.dart';
import 'package:noppal_util/format/number_helper.dart';

class ScreenCotisationItem extends StatelessWidget {
  final Cotisation cotisation;
  final TextStyle _styleGrand= const TextStyle(fontSize: 28);
  const ScreenCotisationItem(this.cotisation,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title:Text('Cotisation N°'+cotisation.id.toString())
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${NumberHelper.format(cotisation.montant!)} FCFA",style: const TextStyle(fontSize: 36,fontWeight: FontWeight.bold),),
                          Text(cotisation.bus!.matricule!,style: _styleGrand,),
                          Text(cotisation.bus!.proprietaire!.nom!,style: _styleGrand,),
                        ],
                      ),
                    ),
                    NbrJour(
                      child: Text("${cotisation.bus!.jourEtat}j",style: TextStyle(fontSize: 28,color: Colors.white),),
                    )
                  ],
                ),
                info(cotisation),
              ],
        ),
      ),
      bottomSheet: Container(
        height: 75,
        padding: EdgeInsets.all(10),
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 20)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )
              )
          ),
          onPressed: () {  },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const<Widget>[
              Icon(Icons.print),
              SizedBox(width: 10,),
              Text("Imprimier"),
            ],
          ),
        ),
      ),
    );
  }


  Widget info(Cotisation cotisation){
    return Container(
      child: Column(
        children: [
          RowEnregistremnt("Pour","${cotisation.interValJour()} jours"),
          RowEnregistremnt("Jusqu'a ",NplDateFormat.dayFormat(cotisation.dateFin!)),
          RowEnregistremnt("Date d'ajout ",NplDateFormat.simpleFormat(cotisation.created_at!)),

          //date enregistremnet
          //cotisé jusqu a
          //nombre de cotisation
        ],
      ),
    );
  }

  Widget ligneCotisation(){
    return Container(
      child: Column(
        children:[

        ]
      ),
    );
  }

  Widget RowEnregistremnt(String titre,String valeur){
    return Row(
      children: [
        Expanded(child: Text(titre)),
        Text(valeur),
      ],
    );
  }
}
