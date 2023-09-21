import 'package:captrans_regulateur/bloc/cotisation/cotisation_en_cours_actif_bloc.dart';
import 'package:captrans_regulateur/bloc/cotisation/cotisation_en_cours_bloc.dart';
import 'package:captrans_regulateur/bloc/cotisation/cotisation_en_cours_par_jour_bloc.dart';
import 'package:captrans_regulateur/bloc/cotisation/total_cotisation_bloc.dart';
import 'package:captrans_regulateur/bloc/fcm/fcm_bloc.dart';
import 'package:captrans_regulateur/bus/search_bus_page.dart';
import 'package:captrans_regulateur/bus/search_bus_param.dart';
import 'package:captrans_regulateur/bus/search_bus_by_mat_page.dart';
import 'package:captrans_regulateur/cotisation/cotisation_home/total_cotisation_card.dart';
import 'package:captrans_regulateur/cotisation/cotisation_page.dart';
import 'package:captrans_regulateur/cotisation/liste_cotisation_en_cours.dart';
import 'package:captrans_regulateur/receveur/select_receveur_page.dart';
import 'package:captrans_regulateur/receveur/select_receveur_param.dart';
import 'package:captrans_regulateur/util_app/titre/titre_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/bloc/enum_loadable_paginate_state.dart';
import 'package:noppal_util/bloc/enum_loadable_state.dart';
import 'package:noppal_util/bloc/select_widget_by_state.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';
import 'package:noppal_util/bloc/simple_loadable_state_paginate.dart';
import 'package:noppal_util/ui/croquis/card_croquis.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


import '../../model/cotisation.dart';
import '../../notification_fcm/key_fcm.dart';
import '../../ui/button/button_h_card.dart';
import '../liste_cotisation_en_cours_par_jour.dart';

class CotisationBody extends StatefulWidget {

  const CotisationBody({Key? key}) : super(key: key);

  @override
  State<CotisationBody> createState() => _CotisationBodyState();
}

class _CotisationBodyState extends State<CotisationBody> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {

      if(_scrollController.position.pixels == (_scrollController.position.maxScrollExtent)){

        CotisationEnCoursBloc bloc= BlocProvider.of<CotisationEnCoursBloc>(context);
        if(bloc.state.state != EnumLoadablePaginateState.LOADING_ADD && !bloc.state.isLimit()) {
          bloc.load();
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<FcmBloc,FcmState>(
      listener: (context,fcmState){
        if(fcmState.data != null){
          if(fcmState.data!['name'] == KeyFcm.NOUVEAU_COLLECTE
              || fcmState.data!['name'] == KeyFcm.SUPPRIMER_COTISATION
              || fcmState.data!['name'] == KeyFcm.NOUVEAU_VERSEMENT ){
            print('niccccccccccccccccccccccce');
            context.read<CotisationEnCoursBloc>().reinit();
            context.read<CotisationEnCoursParJourBloc>().load();
          }

        }


      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cotisations',),
          elevation: 0,
          scrolledUnderElevation: 1,
          backgroundColor: Colors.grey.shade50,
          foregroundColor: Colors.black,
          actions: [
            Row(
              children: [
                Text("Par Jour"),
                BlocBuilder<CotisationEnCoursActifBloc,CotisationEnCoursViewEnum>(
                    builder: (context,state) {
                      print('nouveau----------------------------------------$state',);
                      bool etat=false;
                      if(state == CotisationEnCoursViewEnum.PAR_JOUR)
                        etat=true;
                      return Switch(value:etat , onChanged: (etat){
                        print('etat----------------------------------------$state',);

                        CotisationEnCoursViewEnum enumValue=(etat) ? CotisationEnCoursViewEnum.PAR_JOUR:CotisationEnCoursViewEnum.ALL;
                        context.read<CotisationEnCoursActifBloc>().changerState(enumValue);
                      });

                    }
                ),

              ],
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: BlocBuilder<CotisationEnCoursActifBloc,CotisationEnCoursViewEnum>(
            builder: (context,state) {
              return RefreshIndicator(
                onRefresh: ()async{
                  //context.read<TotalCotisationBloc>().load();

                    BlocProvider.of<CotisationEnCoursParJourBloc>(context).load();

                    BlocProvider.of<CotisationEnCoursBloc>(context).reinit();


                },
                child: CustomScrollView(
                  controller: _scrollController,
                  physics: BouncingScrollPhysics(parent: const AlwaysScrollableScrollPhysics()),
                  slivers: [
                    //MySliverApp("Cotisations"),
                    SliverToBoxAdapter(
                          child:BlocBuilder<TotalCotisationBloc,SimpleLoadableState<int>>(
                            builder: (context,state) {
                              return SelectWidgetByState.select(
                                state.state,
                                {
                                  EnumLoadableState.DONE:TotalCotisationCard(),
                                  EnumLoadableState.LOADING:CardCroquis(
                                    width: double.infinity,
                                    height: 100,
                                    borderRadius: BorderRadius.circular(20),
                                    backgroundColor: Colors.grey.shade300,
                                  )
                                },
                                parDefaut: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey.shade300,
                                  ),
                                )
                              );
                            }
                          )
                    ),

                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: AddCotisationBar(),
                      ),
                    ),

                    SliverToBoxAdapter(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20,bottom: 5),
                          child:  Row(
                            children: [
                              BlocBuilder<CotisationEnCoursBloc,SimpleLoadableStatePaginate<Cotisation>>(
                                builder: (context,state) {
                                  return Titre1(' En cours ( ${(state.state==EnumLoadablePaginateState.DONE)? state.total() :'...'} )',color: Colors.grey.shade700,);
                                }
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),

                    // ListCroquisSliver(4,
                    //   backgroundColor: Colors.grey.shade300,
                    //   shimmerDuration: 1000,
                    // ),
                    BlocBuilder<CotisationEnCoursActifBloc,CotisationEnCoursViewEnum>(
                        builder: (context,state) {
                          if(state == CotisationEnCoursViewEnum.PAR_JOUR){
                           return  ListeCotisationEnCoursParJour(
                              onTap: (BuildContext context, cotisation){
                              },
                            );
                          }
                          else{
                            return ListeCotisationEnCours(
                              onTap: (BuildContext context, cotisation){
                                Navigator.pushNamed(
                                    context,
                                    CotisationPageArgs.routeName,
                                    arguments: CotisationParamWithCotisation(
                                      cotisation:cotisation,
                                    )
                                );
                              },
                            );
                          }

                        }
                    ),



                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}

//--------------------------------------------------------------

class AddCotisationBar extends StatelessWidget {
  const AddCotisationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: ButtonHCard(
                icon: Icons.add_business,
                text: "Ajouter  par Selection",
                iconBackcolor: Colors.blue,
                iconColor: Colors.white,
                onPressed: (){
                  Navigator.pushNamed(context, SearchBusPageArg.routeName,
                      arguments: SearchBusParam(
                          onSelect: (context , bus ) {
                            Navigator.pushNamed(context, SearchBusByMatPage.routeName,
                                arguments:_paramSearch(bus.matricule,canResacn: false));
                          }
                      )
                  );

                },
              )
          ),
          SizedBox(width: 20,),
          Expanded(
              child:ButtonHCard(
                      icon: Icons.qr_code_outlined,
                      text: "Ajouter par Qr Code",
                      iconBackcolor: Colors.blue,
                      iconColor: Colors.white,
                      onPressed: ()async{
                        String matricule = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);
                        if(matricule!='-1'){
                          Navigator.pushNamed(context, SearchBusByMatPage.routeName,
                              arguments:_paramSearch(matricule,canResacn: true)
                          );
                        }
                      },
                    )
          ),
        ],
      ),
    );
  }

  SearchBusByMatParam _paramSearch(matricule,{canResacn=false}){
    return  SearchBusByMatParam(
        matricule: matricule,
        canRescan: canResacn,
        onValidate: (context,bus){;
            Navigator.pushReplacementNamed(context, SelectReceveurPage.routeName,arguments: SelectReceveurParam(bus: bus));
        });
  }


}
