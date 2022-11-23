import 'package:captrans_regulateur/bloc/cotisation/addcotisation/add_cotisation_bloc.dart';
import 'package:captrans_regulateur/bloc/receveur/receveur_recentes_bloc.dart';
import 'package:captrans_regulateur/cotisation/add_cotisation/resume_cotisation_view.dart';
import 'package:captrans_regulateur/model/receveur.dart';
import 'package:captrans_regulateur/receveur/receveur_habituel_list.dart';
import 'package:captrans_regulateur/receveur/search_receveur_page.dart';
import 'package:captrans_regulateur/receveur/select_receveur_param.dart';
import 'package:captrans_regulateur/repository/receveur/receveur_dis_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/bloc/enum_loadable_state.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';
import 'package:noppal_util/ui/croquis/list_croquis.dart';
import 'package:noppal_util/ui/link/searchLInk.dart';

import '../cotisation/add_cotisation/add_montant_cotisation_page.dart';


class SelectReceveurPage extends StatelessWidget {
  static const String routeName="/cotisation/receveur/select";

  const SelectReceveurPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SelectReceveurParam param = ModalRoute.of(context)!.settings.arguments as SelectReceveurParam;
    return BlocProvider<ReceveurRecentesBloc>(
     create: (context)=> ReceveurRecentesBloc(receveurDisRepo: context.read<ReceveurDisRepo>())..load(param.bus),
      child: Scaffold(
        appBar: AppBar(
          //centerTitle: true,
          titleSpacing: 0,
          title: Text('Selectionner un Receveur'),
          elevation: 2,
        ),

        body: BlocBuilder<ReceveurRecentesBloc,SimpleLoadableState<List<Receveur>>>(
           builder: (context,state){
             print(state.state);
;
               if(state.state == EnumLoadableState.DONE) return SelectReceveurView(receveurs: state.value!,);
               else return ListCroquisSliver(
                     2,
                   backgroundColor: Colors.grey.shade300,
                   shimmerDuration: 1000,
                 );


           },
        ),
        bottomSheet:ResumeCotisationView(bus: param.bus,)

      ),
    );
  }
}

class SelectReceveurView extends StatelessWidget {
  final List<Receveur> receveurs;
  const SelectReceveurView({required this.receveurs,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
          child: SearchLInk("Ajouter ou rechercher un receveur . . .",
            onTap: (){
              Navigator.push(context,_goSearchReceveur());
            },
            leading: Padding(
            padding: EdgeInsets.only(right: 25),
              child: Icon(Icons.person_search_outlined,color: Colors.grey.shade600,size: 20),
            ),
            background: Colors.grey.shade300,
            textColor: Colors.grey.shade600,
            borderColor: Colors.transparent,
          ),
        ),


       SizedBox(height: 5,),
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
         child: Text('Receveurs habituels (${receveurs.length})',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
       ),
        if(receveurs.isNotEmpty)...[
          ReceveurHabituelList(receveurs: receveurs,onPressed: (context,receveur){
            BlocProvider.of<AddCotisationBloc>(context).add(AddCotisationSelectedReceveur(receveur));
            Navigator.pushNamed(context, AddMontantCotisationPage.routeName);
          },)
        ]
       ,if(receveurs.isEmpty)...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 30),
            child: Container(
                alignment: Alignment.center,
                child: Text('Aucun reveveur habutel enregistré pour ce bus, Veillez cliquer sur la barre de recherche pour rechercher ou pour ajouter un reveveur',style:TextStyle(color:Colors.grey.shade500),textAlign: TextAlign.center,)
            ),
          ),
        ]

      ],
    );
  }



  Route _goSearchReceveur(){
    return PageRouteBuilder(
        pageBuilder: (context,animation,secondaryAnimation) =>  SearchReceveurPage(
          onSelect:(context,receveur){
            BlocProvider.of<AddCotisationBloc>(context).add(AddCotisationSelectedReceveur(receveur));
            Navigator.pushNamed(context, AddMontantCotisationPage.routeName);
          },
        ),
        transitionDuration: Duration(milliseconds: 300),
        transitionsBuilder: (context,animation,secondaryAnimation,child){
          const begin = Offset(0.0, 0.078);
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end);
          final offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        }
    );
  }
}

