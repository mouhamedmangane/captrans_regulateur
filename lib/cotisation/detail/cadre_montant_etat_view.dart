import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/format/number_helper.dart';
import 'package:noppal_util/ui/croquis/card_croquis.dart';

import '../../bloc/cotisation/cotisation_bloc.dart';
import '../../ui/cadre/cadre_vertical_view.dart';

class CadreMontantEtatView extends StatelessWidget {
  const CadreMontantEtatView({Key? key}) : super(key: key);

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
          if(state.cotisation!=null){
            if(state.cotisation!.montantEtat!=null){
              headerText= "${NumberHelper.format(state.cotisation!.compte!)} FCFA";
            }
          }

          return CadreVerticalTextView(
            borderColor: Colors.green.shade50,
            headerText: headerText,
            bodyText: "Montant restant après cotisations",
          );

        }
    );
  }
}
