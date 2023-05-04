
import 'package:captrans_regulateur/bloc/cotisation/cotisation_bloc.dart';
import 'package:captrans_regulateur/bus/detail_bus_page.dart';
import 'package:captrans_regulateur/cotisation/detail/cadre_montant_view.dart';
import 'package:captrans_regulateur/cotisation/time_line_auto_view.dart';
import 'package:captrans_regulateur/cotisation/time_line_last_view.dart';
import 'package:captrans_regulateur/cotisation/time_line_prev_view.dart';
import 'package:captrans_regulateur/model_dto/cotisation_success.dart';
import 'package:captrans_regulateur/receveur/receveur_list_tile.dart';
import 'package:captrans_regulateur/repository/cotisation/cotisation_repo.dart';
import 'package:captrans_regulateur/ui/button/error_body_view.dart';
import 'package:captrans_regulateur/ui/loading/loading_body_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/ui/croquis/card_croquis.dart';

import '../bus/search_bus_by_mat_page.dart';
import '../model/cotisation.dart';
import 'detail/actual_state_bus_view.dart';
import 'detail/cadre_bus_view.dart';

abstract class CotisationParam{
  dynamic getInitValue();
}
class CotisationParamWithCotisation extends CotisationParam {
  final Cotisation cotisation;
  CotisationParamWithCotisation({required this.cotisation});
  @override
  getInitValue() {
    return cotisation;
  }
}

class CotisationParamWithId extends CotisationParam{
  final int cotisationId;
  CotisationParamWithId({required this.cotisationId});
  @override
  getInitValue() {
    return cotisationId;
  }

}
class CotisationParamComplete extends CotisationParam{
  final CotisationSuccess cotisationSuccess;
  CotisationParamComplete({required this.cotisationSuccess});
  @override
  getInitValue() {
    return cotisationSuccess;
  }
}
class CotisationPageArgs extends StatelessWidget{
  static const String routeName='/cotisation/complete';

  const CotisationPageArgs({Key? key}):super(key:key);
  @override
  Widget build(BuildContext context){
    CotisationParam param= ModalRoute.of(context)!.settings.arguments as CotisationParam;
    return CotisationPage(
          initValue: param.getInitValue(),
    );
  }
}

class CotisationPage extends StatelessWidget {
  final dynamic initValue;
  const CotisationPage({required this.initValue,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CotisationBloc>(
      create: (context)=>CotisationBloc(cotisationRepo: context.read<CotisationRepo>())..add(CotisationInit(initValue)),
      child: const CotisationView(),
    );
  }
}



class CotisationView extends StatelessWidget {
  const CotisationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 2,
        titleSpacing: 0,
        title:BlocBuilder<CotisationBloc,CotisationState>(
          builder: (context,state){
            String info="-----------";
            if(state.status!=CotisationStatus.init ){
              info=state.cotisationId.toString();
            }

            return Text('Cotisation N°$info ');

          },
        ),
        actions: [
          _iconBtnBus(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only( ),
        child: BlocBuilder<CotisationBloc,CotisationState>(
          buildWhen: (previous,current){
            List<CotisationStatus> statuss=[CotisationStatus.errorComplete,CotisationStatus.loadingComplete,CotisationStatus.success];
            if(statuss.contains(previous.status) && statuss.contains(current.status) && previous.cotisationId==current.cotisationId){
              return false;
            }
            return true;
          },
          builder: (context,state){
            if(state.status ==CotisationStatus.loading || state.status==CotisationStatus.init){
              return  const LoadingBodyView();
            }
            else if(state.status == CotisationStatus.error) {
              return ErrorBodyView(
                title: 'Echec recuparation cotisation',
                message: state.message!,
                onTap: (){
                  context.read<CotisationBloc>().add(CotisationLoadWithId(state.cotisationId!));
                },
              );
            }
            return _showCotisation(context,state);

          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:BlocBuilder<CotisationBloc,CotisationState>(
        builder:(context,state){
          bool isCompled =state.bus!=null && state.status==CotisationStatus.success;
          return FloatingActionButton.extended(
              onPressed: (){

              },
              elevation: isCompled ? null : 0,
              disabledElevation: isCompled ? null : 0,
              enableFeedback: isCompled,
              backgroundColor: isCompled ? Colors.blue : Colors.blue.shade100,
              label: Row(
                children: const [
                  Icon(Icons.print_outlined),
                  SizedBox(width: 4,),
                  Text('Imprimer'),
                ],
              ),
          //child: Icon(Icons.print),
          );
        }
      )
    );
  }



  Widget _iconBtnBus(){
    return BlocBuilder<CotisationBloc,CotisationState>(
      builder: (context,state){
        bool isDone= state.status==CotisationStatus.success;
        return IconButton(
          disabledColor: Colors.grey,
          onPressed: (){
            if(isDone){
              Navigator.pushNamed(context, SearchBusByMatPage.routeName,arguments: SearchBusByMatParam(
                  matricule: state.bus!.matricule,
                  canRescan: true,
                  onValidate: (context,mybus){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>BusDetailCotisationPage(bus: mybus)));

                  }));
            }
          },
          icon: const Icon(Icons.directions_bus),
        );
      }
    );
  }


  Widget _showCotisation(BuildContext context,CotisationState state){
    return RefreshIndicator(

      onRefresh: ()async{
        context.read<CotisationBloc>().add(CotisationLoadWithId(state.cotisationId!));
      },
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _chargement(),
            const SizedBox(height: 5,),
            _resume(),
            const SizedBox(height: 5,),

            Card(child: _timelines()),
            const SizedBox(height: 10,),
            Card(child: _receveur(state)),
            const SizedBox(height: 10,),
            Card(child: _etatActuel()),
            const SizedBox(height: 120,),
          ],
        ),
      ),
    );
  }


  Widget _resume(){
    return BlocBuilder<CotisationBloc,CotisationState>(
      builder: (context,state){
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:10.0,left: 10,right: 10,bottom: 10),
              child: Row(
                children:const [
                  Expanded(
                    child:  CadreMontantView(),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child:CadreBusView(),
                  )
                ],
              ),
            ),

          ],
        );
      }
    );
  }
  Widget _receveur(CotisationState state){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          const Text('Receveur',style:  TextStyle(fontWeight: FontWeight.bold),),
          const SizedBox(height: 5,),
          _receveurItem(state)
        ],
      ),
    );
  }
  Widget _receveurItem(CotisationState state){
    if(state.cotisation!=null){
      if(state.cotisation!.receveur!=null){
        return ReceveurListTile(receveur: state.cotisation!.receveur!,);
      }
    }
    return ListTile(title: Text('Aucun receveur'));
  }

  Widget _etatActuel(){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Etat actuel du bus',style:  TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 15,),
          ActualStateBus(),
        ],
      ),
    );
  }


  Widget _timelines(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Chronologie',style: TextStyle(fontWeight: FontWeight.bold),),
          const SizedBox(height: 15,),
          BlocBuilder<CotisationBloc,CotisationState>(
            builder: (context,state) {
              if(state.status==CotisationStatus.error || state.status==CotisationStatus.errorComplete){
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    height:120,
                    child: const Text('error ...'),
                  ),
                );
              }
              else if(state.status == CotisationStatus.loading || state.status==CotisationStatus.loadingComplete){
                return  CardCroquis(
                  height: 240,
                  width: double.infinity,
                  borderRadius: BorderRadius.circular(20),
                  backgroundColor: Colors.grey.shade300,
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  if(state.cotisation != null)...[

                    TimeLineLastView(cotisation:state.cotisation!,nombreDeJour: (state.cotisationAuto==null)?0:state.cotisationAuto!.nombreTotalDeJour(),),
                  ],
                  if(state.cotisationAuto!=null)...[
                    TimeLineAutoView(cotisationAuto: state.cotisationAuto!),
                  ],
                  if(state.resumeLastCotisation!=null)...[
                    TimeLinePrevView(cotisationResume: state.resumeLastCotisation!),
                  ],

                ],
              );
            }
          ),
        ],
      ),
    );
  }

  Widget _chargement(){
    return BlocBuilder<CotisationBloc,CotisationState>(
      builder:(context,state){
        if(state.status==CotisationStatus.loadingComplete){
          return  const LinearProgressIndicator();
        }
        else if(state.status==CotisationStatus.errorComplete){
          return Container(
            color: Colors.red.shade100,
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child: Row(
              children: [
                Expanded(child: Text('${state.message}',style:const TextStyle(fontSize: 15),overflow: TextOverflow.ellipsis,maxLines: 2,)),
                const SizedBox(width: 10,),
                MaterialButton(
                  color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    onPressed: (){
                      context.read<CotisationBloc>().add(CotisationLoadWithId(state.cotisationId!));
                    },
                    child: const Text("Actualise",style: TextStyle(color: Colors.white),)
                )
              ],
            ),
          );
        }
        return Container();
      }
    );
  }















}



