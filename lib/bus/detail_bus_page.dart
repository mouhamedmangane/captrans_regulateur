import 'dart:math';

import 'package:captrans_regulateur/bloc/bus/detail/bus_detail_cotiisation_bloc.dart';
import 'package:captrans_regulateur/model/bus.dart';
import 'package:captrans_regulateur/receveur/receveur_list_tile.dart';
import 'package:captrans_regulateur/repository/cotisation/cotisation_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/bloc/enum_loadable_state.dart';
import 'package:noppal_util/bloc/simple_loadable_state_paginate.dart';
import 'package:noppal_util/date/npl_date_format.dart';
import 'package:noppal_util/format/number_helper.dart';

import '../../../cotisation/list_cotisation_b_item_view.dart';
import '../../../model/cotisation.dart';
import '../cotisation/cotisation_page.dart';
import '../ui/button/error_body_smal_view.dart';
import '../ui/loading/loading_body_view.dart';


class BusDetailCotisationPage extends StatelessWidget {
  final Bus bus;

  const BusDetailCotisationPage({required this.bus,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
            BlocProvider<BusDetailCotisationBloc>(
              create: (context)=>BusDetailCotisationBloc(context.read<CotisationRepo>())..load(bus.id),
            ),
        ],
        child: BusDetailCotisationView(bus:bus),
    );
  }
}


class BusDetailCotisationView extends StatelessWidget {
  final Bus bus;
  const BusDetailCotisationView({required this.bus,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title:Text('${bus.matricule}'),
          titleSpacing: 0,
          elevation: 2,
          actions: [
            IconButton(onPressed: (){

            }, icon: Icon(Icons.payments))
          ],
        ),
        body: RefreshIndicator(
          onRefresh: ()async{
            BlocProvider.of<BusDetailCotisationBloc>(context).load(bus.id);
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10,),
                _proprietaire(context),
                SizedBox(height: 10,),
                _etat(),
                SizedBox(height: 10,),
                _info(),
                SizedBox(height: 10,),
                _receveur(context),
                SizedBox(height: 10,),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left:15,top: 15,bottom: 4),
                        child: Text('Cotisations'),
                      ),
                      BlocBuilder<BusDetailCotisationBloc,SimpleLoadableStatePaginate<Cotisation>>(
                        builder: (context,state){
                          if(state.state == EnumLoadableState.LOADING || state.state==EnumLoadableState.INIT) {
                            return LoadingBodyView(verticalPadding: 50);
                          } else if(state.state == EnumLoadableState.ERROR) {
                            return ErrorBodySmallView(
                              topPadding: 15,
                                onTap: (){
                                  context.read<BusDetailCotisationBloc>().load(bus.id);
                                },
                                title: 'Echec chargment liste cotisation',
                                message: state.message!
                            );
                          } else {
                            return _cotisations(context,state.value.data);
                          }
                        },
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(bottom: 10),
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Voir plus',style: TextStyle(color: Colors.blue),),
                              Icon(Icons.keyboard_arrow_right,)
                            ],
                          ),
                          onPressed: () {  },
                        ),
                      )
                    ],
                  ),
                ),
                //SizedBox(height: 30,),


              ],
            ),
          ),
        ),

    );
  }


  Widget _etat(){
    return Card(
      child: Column(
        children: [

          ListTile(
            leading: Icon(Icons.wb_sunny_outlined),
            title: Text('Etat jour'),
            trailing: Chip(
              backgroundColor: ((bus.jourEtat??0)>=0)?Colors.green:Colors.red,
                label: Text('${NumberHelper.format(bus.jourEtat ?? 0)} jours',style: TextStyle(color: Colors.white),)
            ) ,
          ),
          ListTile(
            leading: Icon(Icons.real_estate_agent_outlined),
            title: Text('Etat montant'),
            trailing: Text('${NumberHelper.format(bus.montantEtat ?? 0)} FCFA') ,
          ),
          ListTile(
            leading: Icon(Icons.timer_outlined),
            title: Text('Cotisé jusqu\'à'),
            trailing: Text('${NplDateFormat.dayFormat(bus.lastDateCotisation,separator: '-')}') ,
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet_outlined),
            title: Text('Compte'),
            trailing: Text('${NumberHelper.format(bus.compte ?? 0)} FCFA') ,
          ),

        ],
      ),
    );
  }


  Widget _info(){
    print('""""""""""""""""""""""""');
    print(bus);
    return Card(
      child: Column(
        children: [

          ListTile(
            leading: Icon(Icons.group_work_outlined),
            title: Text('Gie'),
            trailing: Text('${bus.nomGie}') ,
          ),
          ListTile(
            leading: Icon(Icons.line_axis_outlined),
            title: Text('Ligne'),
            trailing: Text('${bus.numeroLigne}') ,
          ),
          ListTile(
            leading: Icon(Icons.car_repair_outlined),
            title: Text('Marque'),
            trailing: Text('${bus.marque??'Non défini'}') ,
          ),
          ListTile(
            leading: Icon(Icons.bookmark_added_outlined),
            title: Text('Entré en Vigueur'),
            trailing: Text('${NplDateFormat.dayFormat(bus.dateEnVigueur)}') ,
          ),
        ],
      ),
    );

  }

  Widget _proprietaire(BuildContext context){
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left:15,top: 10,),
            child: Text('Proprietaire'),
          ),

          ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.personal_injury_outlined),
              ],
            ),
            title: Text('${bus.proprietaire!.nom}'),
            subtitle: Text('${bus.proprietaire!.tel}'),
          ),
        ],
      ),
    );
  }

  Widget _cotisations(BuildContext context,List<Cotisation> cotisations){
    return Column(
      children: [
        Column(
          children: cotisations.map((cotisation)=>ListeCotisationBItemView(
            cotisation,
            onTap: (context,cotisation){
              Navigator.pushNamed(context, CotisationPageArgs.routeName,arguments: CotisationParamWithCotisation(
                cotisation: cotisation,
              ));
            },
          )).toList(),
        ),

      ],
    );
  }

  Widget _receveur(BuildContext context){
    bool notNullReceveur=bus.receveurs!=null;

    bool notEmptyReceveur=false;
    if(notNullReceveur){
      notEmptyReceveur=bus.receveurs!.isNotEmpty;
    }
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left:15,top: 15,),
            child: Row(
              children: [
                const Text('Receveur'),
                if(notEmptyReceveur)...[
                  Text(" [ ${bus.receveurs!.length} ] ",),
                ],
              ],
            ),
          ),
          if(notNullReceveur)...[
            Column(
              children: bus.receveurs!.sublist(0,min(3,bus.receveurs!.length)).map((e) =>ReceveurListTile(receveur: e)).toList(),
            )
          ],
          if(!notNullReceveur || !notEmptyReceveur)...[
            ListTile(title: Text('   Aucun'),),
          ],
          if(notEmptyReceveur)...[
            Container(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed:(){
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Voir plus',style: TextStyle(color: Colors.blue),),
                      Icon(Icons.keyboard_arrow_right,)
                    ],
                  )
              ),
            )
          ],

        ],
      ),
    );
  }



}

