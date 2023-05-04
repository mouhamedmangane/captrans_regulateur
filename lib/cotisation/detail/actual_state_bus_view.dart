

import 'package:captrans_regulateur/ui/listitem/cle_valeur_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/format/number_helper.dart';
import 'package:noppal_util/ui/croquis/card_croquis.dart';

import '../../bloc/cotisation/cotisation_bloc.dart';
import '../../model/bus.dart';

class ActualStateBus extends StatelessWidget {
  const ActualStateBus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CotisationBloc,CotisationState>(
        builder: (context,state){
          if(state.status==CotisationStatus.loadingComplete || state.status==CotisationStatus.loading){
            return  CardCroquis(
              height: 120,
              width: double.infinity,
              borderRadius: BorderRadius.circular(20),
              backgroundColor: Colors.grey.shade300,
            );
          }
          else if(state.status == CotisationStatus.errorComplete){
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                height:120,
                child: const Text('error ...'),
              ),
            );
          }

          String etatMontant="-------";
          String etatJour="-------";
          bool isGoodEtat=false;
          //String compte="-------";
          Bus ? bus;
          if(state.bus!=null){
            bus=state.bus!;
          }
          else if(state.cotisation!=null){
              bus=state.cotisation!.bus;
          }
          if(bus!=null){
            etatJour="${NumberHelper.format(bus.jourEtat!)} jours";
            etatMontant="${NumberHelper.format(bus.montantEtat!)} fcfa";
            isGoodEtat=bus.jourEtat! >=0;
            //compte="${NumberHelper.format(state.bus!.compte!)} fcfa";
          }

          return Column(
            children: [
              CleValeurView(
                cle: const Text('Etat Jour'),
                valeur:Text(
                  etatJour,
                  style: TextStyle(color:isGoodEtat ? Colors.green:Colors.red,fontWeight: FontWeight.bold),

                ),
                icon:Icons.sunny,
              ),
              CleValeurView(
                cle: const Text('Etat Montant'),
                valeur: Text(etatMontant,style: TextStyle(color: Colors.grey.shade800,fontWeight: FontWeight.bold),),
                icon:Icons.money,
              ),

            ],
          );
        }
    );

  }
}
