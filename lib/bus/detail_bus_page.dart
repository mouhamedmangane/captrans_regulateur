import 'package:captrans_regulateur/bloc/bus/detail/bus_detail_cotiisation_bloc.dart';
import 'package:captrans_regulateur/model/bus.dart';
import 'package:captrans_regulateur/repository/cotisation/cotisation_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/bloc/enum_loadable_state.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';
import 'package:noppal_util/date/npl_date_format.dart';

import '../../../cotisation/list_cotisation_b_item_view.dart';
import '../../../model/cotisation.dart';
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
            create: (context)=>BusDetailCotisationBloc(cotisationRepo: context.read<CotisationRepo>())..load(bus.id),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title:Text('${bus.matricule}'),
          titleSpacing: 0,
          elevation: 2,
          actions: [
            IconButton(onPressed: (){

            }, icon: Icon(Icons.payments))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              _proprietaire(context),
              SizedBox(height: 10,),
              _info(),
              SizedBox(height: 10,),
              _etat(),
              SizedBox(height: 10,),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left:15,top: 15,bottom: 4),
                      child: Text('Cotisations'),
                    ),
                    BlocBuilder<BusDetailCotisationBloc,SimpleLoadableState<List<Cotisation>>>(
                      builder: (context,state){
                        if(state.state == EnumLoadableState.LOADING || state.state==EnumLoadableState.INIT)
                          return LoadingBodyView(verticalPadding: 50);
                        else if(state.state == EnumLoadableState.ERROR)
                          return ErrorBodySmallView(
                            topPadding: 15,
                              onTap: (){
                                context.read<BusDetailCotisationBloc>().load(bus.id);
                              },
                              title: 'Echec chargment liste cotisation',
                              message: state.message!
                          );
                        else
                          return _cotisations(state.value!);
                      },
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(bottom: 10),
                      alignment: Alignment.center,
                      child: TextButton(
                        child: Text('Vour Plus >',style: TextStyle(color: Colors.blue),),
                        onPressed: () {  },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30,),


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
            trailing: Text('${bus.jourEtat} jours') ,
          ),
          ListTile(
            leading: Icon(Icons.real_estate_agent_outlined),
            title: Text('Etat montant'),
            trailing: Text('${bus.compte}') ,
          ),
          ListTile(
            leading: Icon(Icons.group_work_outlined),
            title: Text('Gie'),
            trailing: Text('${bus.nomGie}') ,
          ),
          ListTile(
            leading: Icon(Icons.line_axis_outlined),
            title: Text('Numero Ligne'),
            trailing: Text('${bus.numeroLigne}') ,
          )
        ],
      ),
    );
  }

  Widget _info(){
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.mark_as_unread_outlined),
            title: Text('Marque'),
            trailing: Text('${bus.marque}') ,
          ),
          ListTile(
            leading: Icon(Icons.bookmark_added_outlined),
            title: Text('Crée le'),
            trailing: Text('${NplDateFormat.dayFormat(bus.created_at!)}') ,
          )
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

  Widget _cotisations(List<Cotisation> cotisations){
    return Column(
      children: [
        Column(
          children: cotisations.map((cotisation)=>ListeCotisationBItemView(cotisation)).toList(),
        ),

      ],
    );
  }
}

