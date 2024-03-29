import 'package:captrans_regulateur/bloc/cotisation/cotisation_en_cours_bloc.dart';
import 'package:captrans_regulateur/bloc/cotisation/cotisation_en_cours_par_jour_bloc.dart';
import 'package:captrans_regulateur/cotisation/ListCotisationItem.dart';
import 'package:captrans_regulateur/model/cotisation.dart';
import 'package:captrans_regulateur/model_dto/cotisation_global_info_jour_dto.dart';
import 'package:captrans_regulateur/ui/button/error_body_smal_view.dart';
import 'package:captrans_regulateur/ui/loading/loading_body_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/bloc/enum_loadable_paginate_state.dart';
import 'package:noppal_util/bloc/enum_loadable_state.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';
import 'package:noppal_util/bloc/simple_loadable_state_paginate.dart';

import 'list_cotisation_par_jour_item.dart';

class ListeCotisationEnCoursParJour extends StatelessWidget {
  final void Function(BuildContext,CotisationGlobalInfoJour) ? onTap;

  ListeCotisationEnCoursParJour({this.onTap,Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<CotisationEnCoursParJourBloc,SimpleLoadableState<List<CotisationGlobalInfoJour>>>(
      builder: (context,state) {

        if(state.state == EnumLoadableState.LOADING) {
          return loading(context);
        }
        else if(state.state == EnumLoadableState.INIT){
          return init(context);
        }
        else if(state.state == EnumLoadableState.ERROR){
          return error(context,state);
        }
        return done(context,state);
      }
    );
  }

  Widget done(BuildContext context,SimpleLoadableState<List<CotisationGlobalInfoJour>> state){

    return SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context,int index){

                return ListeCotisationParJourItem(
                  state.value![index],
                  onTap:onTap,
                );


          },
          childCount:state.value!.length,
        )
    );
  }




  Widget error(BuildContext context,SimpleLoadableState state){
    return SliverToBoxAdapter(

      child: ErrorBodySmallView(
        title: 'Echec chargment cotisation en cours',
        message: state.message!,
        onTap: (){
          context.read<CotisationEnCoursBloc>().load();
        },
      ),
    );
  }

  Widget loading(BuildContext context){
    return SliverToBoxAdapter(key:ValueKey(19),child: LoadingBodyView(verticalPadding: 50,));

  }
  Widget init(BuildContext context){
    return SliverToBoxAdapter(key:ValueKey(19),child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add_reaction_outlined,color: Colors.grey.shade500,size: 70,),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text('Aucun cotisatation en cours. Pour ajouter un nouveau cotisation par scan code vous pouvez cliquer sur le bouton en haut a gauche, ou en haut à droit pour ajouter par selection de bus.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade500,fontSize: 14),
            ),
          ),
        ],
      ),
    ));
  }
}
