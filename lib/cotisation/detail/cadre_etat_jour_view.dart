import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/ui/croquis/card_croquis.dart';

import '../../bloc/cotisation/cotisation_bloc.dart';
import '../../ui/cadre/cadre_vertical_view.dart';

class CadreEtatJourView extends StatelessWidget {
  const CadreEtatJourView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CotisationBloc,CotisationState>(
        builder: (context,state){
          if(state.status==CotisationStatus.loadingComplete || state.status==CotisationStatus.loading){
            return CardCroquis(
              height: 120,
              width: double.infinity,
              borderRadius: BorderRadius.circular(20),
              backgroundColor: Colors.grey.shade300,
            );
          }
          String headerText="-------";
          Color backColor= Colors.blue.shade100;
          Color borderColor= Colors.blue.shade50;
          if(state.cotisation!=null){
            if(state.cotisation!.jourEtat!=null){
              String plusOuMoins;
              if(state.cotisation!.jourEtat!>=0){
                backColor= Colors.green.shade100;
                borderColor= Colors.green.shade50;
                plusOuMoins= '+';
              }
              else{
                backColor= Colors.red.shade100;
                borderColor= Colors.red.shade50;
                plusOuMoins= '';
              }
              headerText="$plusOuMoins ${state.cotisation!.jourEtat} jours";
            }

          }
          return  CadreVerticalTextView(
            backColor: backColor,
            borderColor: borderColor,
            headerText: headerText,
            bodyText: 'Etat aprés cette cotisation',
          );

        }
    );
  }
}
