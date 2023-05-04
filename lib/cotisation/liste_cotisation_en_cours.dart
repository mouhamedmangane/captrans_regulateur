import 'package:captrans_regulateur/bloc/cotisation/cotisation_en_cours_bloc.dart';
import 'package:captrans_regulateur/cotisation/ListCotisationItem.dart';
import 'package:captrans_regulateur/model/cotisation.dart';
import 'package:captrans_regulateur/ui/button/error_body_smal_view.dart';
import 'package:captrans_regulateur/ui/loading/loading_body_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/bloc/enum_loadable_paginate_state.dart';
import 'package:noppal_util/bloc/simple_loadable_state_paginate.dart';

class ListeCotisationEnCours extends StatelessWidget {
  final void Function(BuildContext,Cotisation) ? onTap;

  ListeCotisationEnCours({this.onTap,Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<CotisationEnCoursBloc,SimpleLoadableStatePaginate<Cotisation>>(
      builder: (context,state) {

        if(state.state == EnumLoadablePaginateState.LOADING) {
          return loading(context,state);
        }
        else if(state.state == EnumLoadablePaginateState.INIT){
          return init(context,state);
        }
        else if(state.state == EnumLoadablePaginateState.ERROR){
          return error(context,state);
        }
        return done(context, state);
      }
    );
  }

  Widget done(BuildContext context,SimpleLoadableStatePaginate state){
    int count=state.value.data.length;
    if(state.state == EnumLoadablePaginateState.LOADING_ADD ||
        state.state==EnumLoadablePaginateState.ERROR_ADD
    )
      count++;

    return SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context,int index){
              if(index==count-1){
                  if(state.state == EnumLoadablePaginateState.ERROR_ADD)
                    return errorAdd(context, state);
                  if(state.state == EnumLoadablePaginateState.LOADING_ADD)
                    return loadingAdd(context, state);
              }
                return ListeCotisationItem(
                  state.value.data[index],
                  onTap:onTap,
                );


          },
          childCount:count,
        )
    );
  }

  Widget loadingAdd(BuildContext context, SimpleLoadableStatePaginate state){
    return Container(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }
  Widget errorAdd(BuildContext context, SimpleLoadableStatePaginate state){
    return Text(state.message??"");
  }

  Widget error(BuildContext context,SimpleLoadableStatePaginate state){
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

  Widget loading(BuildContext context,SimpleLoadableStatePaginate state){
    return SliverToBoxAdapter(key:ValueKey(19),child: LoadingBodyView(verticalPadding: 50,));

  }
  Widget init(BuildContext context,SimpleLoadableStatePaginate state){
    return SliverToBoxAdapter(key:ValueKey(19),child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 90,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add_reaction_outlined,color: Colors.grey.shade500,size: 90,),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text('Aucun cotisatation en cours. Pour ajouter un nouveau cotisation par scan code vous pouvez cliquer sur le bouton en haut a gauche, ou en haut à droit pour ajouter par selection de bus.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade500,fontSize: 16),
            ),
          ),
        ],
      ),
    ));
  }
}
