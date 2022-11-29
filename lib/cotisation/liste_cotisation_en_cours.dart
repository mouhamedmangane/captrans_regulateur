import 'package:captrans_regulateur/bloc/cotisation/cotisation_en_cours_bloc.dart';
import 'package:captrans_regulateur/cotisation/ListCotisationItem.dart';
import 'package:captrans_regulateur/model/cotisation.dart';
import 'package:captrans_regulateur/ui/button/error_body_smal_view.dart';
import 'package:captrans_regulateur/ui/loading/loading_body_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/bloc/enum_loadable_state.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';

class ListeCotisationEnCours extends StatelessWidget {
  final Function(BuildContext,Cotisation ? cotisation)? onTap;
  ListeCotisationEnCours({this.onTap,Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<CotisationEnCoursBloc,SimpleLoadableState<List<Cotisation>>>(
      builder: (context,state) {
        if(state.state == EnumLoadableState.LOADING) {
          return SliverToBoxAdapter(key:ValueKey(19),child: LoadingBodyView(verticalPadding: 50,));
        }
        else if(state.state == EnumLoadableState.INIT){
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
        else if(state.state == EnumLoadableState.ERROR){
          return SliverToBoxAdapter(
          key:ValueKey(19),
          child: ErrorBodySmallView(
              title: 'Echec chargment cotisation en cours',
              message: state.message!,
              onTap: (){
                context.read<CotisationEnCoursBloc>().load();
              },
            ),
          );
        }
        return SliverList(
            key:ValueKey(19),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context,int index){
                return ListeCotisationItem(
                  onTap:onTap,
                  state.value![index]
                );
              },
              childCount: state.value!.length,
            )
        );
      }
    );
  }
}
