

import 'package:captrans_regulateur/bloc/cotisation/cotisation_bloc.dart';
import 'package:captrans_regulateur/model/bus.dart';
import 'package:captrans_regulateur/model/receveur.dart';
import 'package:captrans_regulateur/receveur/receveur_list_tile.dart';
import 'package:captrans_regulateur/repository/cotisation/cotisation_repo.dart';
import 'package:captrans_regulateur/ui/button/error_body_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/bloc/enum_loadable_state.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';
import 'package:noppal_util/date/npl_date_format.dart';
import 'package:noppal_util/format/number_helper.dart';

import '../model/cotisation.dart';

class CotisationParam {
  final Cotisation cotisation;
  final bool mustCompleted;
  CotisationParam({required this.cotisation,this.mustCompleted=false});
}
class CotisationPageArgs extends StatelessWidget{
  static const String routeName='/cotisation/complete';
  @override
  Widget build(BuildContext context){
    CotisationParam param= ModalRoute.of(context)!.settings.arguments as CotisationParam;
    return CotisationPage(
      cotisation: param.cotisation,
      mustCompleted: param.mustCompleted,
    );
  }
}
class CotisationPage extends StatelessWidget {
  final bool mustCompleted;
  final Cotisation cotisation;
  const CotisationPage({required this.cotisation,this.mustCompleted=false,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CotisationBloc>(
      create: (context)=>CotisationBloc(cotisationRepo: context.read<CotisationRepo>())..init(cotisation, mustCompleted),
      child: CotisationView(),
    );
  }
}

class CotisationView extends StatelessWidget {
  const CotisationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        //elevation: 2,
        title: _titleText(),
        actions: [
          _iconBtnBus(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:15.0,right: 15, top: 10),
        child: BlocBuilder<CotisationBloc,SimpleLoadableState<Cotisation>>(
          builder: (context,state){
            if([EnumLoadableState.DONE,EnumLoadableState.ERROR].contains(state.state)){
              return _cotisationDone(state.value!);
            }
            return _loading();
          },
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(20),
            ))
          ),
          onPressed: () {  },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.print),
              Text(' Imprimer'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleText(){
    return BlocBuilder<CotisationBloc,SimpleLoadableState<Cotisation>>(
      builder: (context,state){
        String info="-----------";
        if(state.state==EnumLoadableState.DONE){
          info=state.value!.id.toString();
        }
        return Text('Cotisation N°${info} ');
      },
    );
  }

  Widget _iconBtnBus(){
    return BlocBuilder<CotisationBloc,SimpleLoadableState<Cotisation>>(
        builder: (context,state){
      bool isDone= state.state==EnumLoadableState.DONE;
      return IconButton(
        disabledColor: Colors.grey,

        onPressed: (){
          if(isDone){

          }
        },
        icon: Icon(Icons.bus_alert),
      );
      }
    );
  }

  Widget _loading() {
    return Container(
    );
  }

  Widget _cotisationDone(Cotisation cotisation){
    return SingleChildScrollView(
      child: Column(
        children: [
          _cotisationEntete(cotisation),
          _cotisationBus(cotisation.bus!),
          _coitsationReceveur(cotisation.receveur!),
        ],
      ),
    );
  }

  Widget _cotisationEntete(Cotisation cotisation){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
      child: Column(
        children: [

          Row(
            children: [
              Text('${NumberHelper.format(cotisation.montant)} FCFA',style: TextStyle(fontSize: 29),),
              Spacer(),
              Text('${NplDateFormat.simpleFormat(cotisation.created_at!)}')
            ],
          ),
          SizedBox(height:10),
          Row(
            children: [
              Text('Date Debut ${NplDateFormat.dayFormat(cotisation.dateDebut)}'),
              Spacer(),
              Text('Date Debut ${NplDateFormat.dayFormat(cotisation.dateFin)}')
            ],
          )
        ],
      ),
    );
  }

  Widget _cotisationBus(Bus bus){
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Bus',style: TextStyle(fontSize: 16),),
          SizedBox(height: 6,),
          Row(
            children: [
              Text('${bus.nomGie} / ${bus.numeroLigne} / '),
              Text('${bus.matricule}',style: TextStyle(fontSize: 28),),
            ],
          ),
          SizedBox(height: 6,),
          Text('Proprietaire :',),
        ],
      ) ,
    );
  }

  Widget _coitsationReceveur(Receveur receveur){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 15,right: 15,top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Receveur',style: TextStyle(fontSize: 16),),
          ReceveurListTile(receveur: receveur,),
        ],
      ),
    );

  }

}



