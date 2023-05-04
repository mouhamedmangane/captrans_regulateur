import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/ui/croquis/card_croquis.dart';

import '../../bloc/cotisation/cotisation_bloc.dart';
import '../../ui/cadre/cadre_vertical_view.dart';

class CadreBusView extends StatelessWidget {
  const CadreBusView({Key? key}) : super(key: key);

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
          String bodyText="---------------";
          String headerText="-------";
          if(state.bus!=null){
            headerText= state.bus!.matricule;
            bodyText='L ${state.bus!.numeroLigne} -  ${state.bus!.nomGie} - ${state.bus!.proprietaire!.nom} Ndiaye darou salam';
          }
          else if (state.cotisation!=null){
            if(state.cotisation!.bus!=null){
              headerText= state.cotisation!.bus!.matricule;
              bodyText='L ${state.cotisation!.bus!.numeroLigne} -  ${state.cotisation!.bus!.nomGie} - ${state.cotisation!.bus!.proprietaire!.nom} ';
            }
          }

          return CadreVerticalTextView(
            borderColor: Colors.yellow.shade50,
            headerText:headerText,
            bodyText: bodyText,
          );
        }
    );
  }
}
