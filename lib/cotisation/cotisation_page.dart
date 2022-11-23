

import 'package:captrans_regulateur/bloc/cotisation/cotisation_bloc.dart';
import 'package:captrans_regulateur/model/bus.dart';
import 'package:captrans_regulateur/model/ligne_cotisation.dart';
import 'package:captrans_regulateur/model/receveur.dart';
import 'package:captrans_regulateur/receveur/receveur_list_tile.dart';
import 'package:captrans_regulateur/repository/cotisation/cotisation_repo.dart';
import 'package:captrans_regulateur/ui/button/error_body_view.dart';
import 'package:captrans_regulateur/ui/listitem/MyDivider.dart';
import 'package:captrans_regulateur/ui/listitem/cle_valeur_view.dart';
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
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 2,
        titleSpacing: 0,
        title: _titleText(),
        actions: [
          _iconBtnBus(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only( ),
        child: BlocBuilder<CotisationBloc,SimpleLoadableState<Cotisation>>(
          builder: (context,state){
            if([EnumLoadableState.DONE,EnumLoadableState.ERROR].contains(state.state)){
              return _cotisationDone(context,state.value!);
            }
            return _loading();
          },
        ),
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: (){

        },
        child: Icon(Icons.print),
      )


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

  Widget _cotisationDone(BuildContext context,Cotisation cotisation){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _cotisationEntete(cotisation),
          SizedBox(height: 10,),
          _ligneCotisation(context,cotisation.ligneCotisations!),
          SizedBox(height: 30,),

        ],
      ),
    );
  }
  Widget _montant(Cotisation cotisation){
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: ListTile(
              title:Text('${NumberHelper.format(cotisation.montant)} FCFA',style: TextStyle(fontSize: 29,fontWeight: FontWeight.bold),) ,
              subtitle: Text('Montant cotisation'),
            ),
          ),
          CleValeurView(
            cle: Text('Montant Cotissé',),
            valeur: Chip(
                label: Text('${NumberHelper.format(cotisation.montant)} FCFA',style: TextStyle(color: Colors.white),),
                 backgroundColor: Colors.blue,
            ),
            icon: Icons.payment,
          ),
          CleValeurView(
            icon: Icons.sunny,
            cle:Text('Date enregistrement',),
            valeur:Text(' ${NplDateFormat.simpleFormat(cotisation.created_at!)}'),
          ),
          ListTile(
            title: Text('Periode cotisé',),
            subtitle: Text('[ ${NplDateFormat.dayFormat(cotisation.dateDebut,separator: '-')} , ${NplDateFormat.dayFormat(cotisation.dateFin,separator: '-')} ] '),
            leading: Icon(Icons.calendar_month),
          ),
        ],
      ),
    );
  }

  Widget _bus(Cotisation cotisation){
    return Card(
      child: Column(
        children: [
          ListTile(
            trailing:Text(' ${cotisation.bus!.matricule}  ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)) ,
            title: Text('Matricule Bus'),
            leading: Icon(Icons.departure_board,),
          ),

          CleValeurView(
            cle: Text('Proprietaire Bus'),
            valeur: Text('${cotisation.bus!.proprietaire!.nom}',),
            icon: Icons.personal_injury,
          ),

          CleValeurView(
            cle: Text('Gie'),
            valeur:Text('${cotisation.bus!.nomGie} '),
            icon: Icons.group_work,
          ),
          CleValeurView(
            cle: Text('Numero ligne'),
            valeur:Text('${cotisation.bus!.numeroLigne}',),
            icon: Icons.line_axis,
          ),

        ],
      ),
    );
  }


  Widget _receveur(Cotisation cotisation){
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Padding(
            padding: EdgeInsets.only(left:15,top: 10,),
            child: Text('Receveur'),
          ),
          ReceveurListTile(receveur: cotisation.receveur!)
        ]
      )
    );
  }
  
  Widget _cotisationEntete(Cotisation cotisation){
    TextStyle style=TextStyle(color: Colors.black);
    TextStyle style2=TextStyle(color: Colors.grey);
    return Column(
      children: [
        SizedBox(height: 10,),
        _montant(cotisation),
        SizedBox(height: 10,),
        _bus(cotisation),
        SizedBox(height: 10,),
        _receveur(cotisation),


      ],
    );
  }





  Widget _ligneCotisation(BuildContext context,List<LigneCotisation> ligneCotisations){
    return Card(

      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10,bottom: 15,left: 15),
            child: Text('Details Cotisations'),
          ),
         // MyDivider(color: Colors.grey.shade200),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),

            child: Column(
              children: ListTile.divideTiles(
                context: context ,
                tiles:ligneCotisations.map((e) => _ligneCotisationItem(e)).toList(),
              ).toList(),
            ),
          )
        ],
      ) ,
    );
  }

  ListTile _ligneCotisationItem(LigneCotisation ligneCotisation){
    TextStyle style=TextStyle(color:Colors.grey.shade800,fontSize: 14);
    return ListTile(
      trailing: Text('${ligneCotisation.nombreDeDepot} j',),
      contentPadding: EdgeInsets.zero,
     // minLeadingWidth: 0,
      minVerticalPadding: 10,
      title:Text('${NumberHelper.format(ligneCotisation.total!)} FCFA',style: TextStyle(fontSize: 20,),),
      subtitle: Column(
        children: [
          SizedBox(height: 10,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Chip(label: Text('De : ${NplDateFormat.dayFormat(ligneCotisation.dateDebut!)}',style: style),),
              SizedBox(width: 5,),
              Chip(label: Text(' A : ${NplDateFormat.dayFormat(ligneCotisation.dateFin!)}',style: style,)),
            ],
          ),
          Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Chip(label:Text('P.Cap : ${NumberHelper.format(ligneCotisation.prixCaptrans!)}',style: style,)),
              SizedBox(width: 5,),
              Chip(label :Text('P.Gie : ${NumberHelper.format(ligneCotisation.prixGie!)}',style: style,)),
              SizedBox(width: 5,),
              Chip(label: Text('P.Sup : ${NumberHelper.format(ligneCotisation.prixCaptrans!)}',style: style,)),
            ],
          ),
        ],
      ),
    );
  }

}



