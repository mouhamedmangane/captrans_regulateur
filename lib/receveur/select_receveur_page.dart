import 'package:captrans_regulateur/bloc/cotisation/addcotisation/add_cotisation_bloc.dart';
import 'package:captrans_regulateur/bloc/receveur/receveur_recentes_bloc.dart';
import 'package:captrans_regulateur/bus/bus_resume.dart';
import 'package:captrans_regulateur/bus/search_bus_button.dart';
import 'package:captrans_regulateur/model/bus.dart';
import 'package:captrans_regulateur/model/receveur.dart';
import 'package:captrans_regulateur/receveur/receveur_habituel_list.dart';
import 'package:captrans_regulateur/receveur/search_receveur_page.dart';
import 'package:captrans_regulateur/receveur/search_receveur_param.dart';
import 'package:captrans_regulateur/receveur/select_receveur_param.dart';
import 'package:captrans_regulateur/repository/receveur/receveur_dis_repo.dart';
import 'package:captrans_regulateur/ui/button/error_body_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/bloc/enum_loadable_state.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';
import 'package:noppal_util/ui/croquis/list_croquis.dart';
import 'package:noppal_util/ui/link/searchLInk.dart';


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
               if(state.state ==EnumLoadableState.ERROR) return Padding(
                 padding: const EdgeInsets.only(bottom:90,left: 40,right: 40),
                 child: ErrorBodyView(
                     onTap: (){
                       context.read<ReceveurRecentesBloc>().load(param.bus!);
                     },
                     title: "Data Faillure",
                     message: state.message??'',

                 ),
               );
               else if(state.state == EnumLoadableState.DONE) return SelectReceveurView(receveurs: state.value!,);
               else return ListCroquisSliver(
                     2,
                   backgroundColor: Colors.grey.shade300,
                   shimmerDuration: 1000,
                 );


           },
        ),
        bottomSheet:Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color:Colors.grey.shade50,
            boxShadow: [
              BoxShadow()
            ],
           borderRadius: BorderRadius.vertical(top: Radius.circular(15) ),
          ),
          height:85,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BusResume(param.bus),
              ],
            )
        ),

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
        ReceveurHabituelList(receveurs: receveurs),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 30),
        //   child: Container(
        //     alignment: Alignment.center,
        //     child: Text('Si le Receveur ne figure pas dans cette liste veillez cliquer sur la barre de recherche pour sélectionner ou pour ajouter un receveur',style:TextStyle(color:Colors.grey.shade400),textAlign: TextAlign.center,)
        //   ),
        // ),
      ],
    );
  }



  Route _goSearchReceveur(){
    return PageRouteBuilder(
        pageBuilder: (context,animation,secondaryAnimation) =>  SearchReceveurPage(
          onSelect:(receveur){},
        ),
        transitionDuration: Duration(milliseconds: 100),
        transitionsBuilder: (context,animation,secondaryAnimation,child){
          const begin = Offset(0.0, 0.085);
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

