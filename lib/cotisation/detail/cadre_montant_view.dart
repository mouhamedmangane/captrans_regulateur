import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/date/npl_date_format.dart';
import 'package:noppal_util/format/number_helper.dart';
import 'package:noppal_util/ui/croquis/card_croquis.dart';

import '../../bloc/cotisation/cotisation_bloc.dart';
import '../../ui/cadre/cadre_vertical_view.dart';

class CadreMontantView extends StatelessWidget {
  const CadreMontantView({Key? key}) : super(key: key);

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
          String bodyText="---------------";
          String headerText="-------";
          Color  ? montantColor;
          if(state.cotisation!=null){
            headerText= "${NumberHelper.format(state.cotisation!.montant)} FCFA";
            bodyText= '${NplDateFormat.simpleFormat(state.cotisation!.createdAt,addTime:true,verbose: true)}';
            if(state.cotisation!.jourEtat!=null) {
              if (state.cotisation!.jourEtat! >= 0) {
                montantColor = Colors.green.shade100;
              }
              else {
                montantColor = Colors.red.shade100;
              }
            }
          }
          return CadreVerticalTextView(
            backColor: montantColor,
            headerText: headerText,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Montant cotisé',style: TextStyle(color: Colors.grey.shade700,height: 1.2),),
                Wrap(
                  children: [
                    //Text('Date : ',style: TextStyle(color: Colors.grey.shade700,height: 1.2),),
                    Text(bodyText,style: TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.bold,height: 1.2),)
                  ],
                )
              ],
            ),
          );

        }
    );
  }
}
