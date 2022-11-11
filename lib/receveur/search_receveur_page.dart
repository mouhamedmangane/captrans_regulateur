import 'package:captrans_regulateur/bloc/receveur/search/receveur_search_bloc.dart';
import 'package:captrans_regulateur/model/receveur.dart';
import 'package:captrans_regulateur/receveur/receveur_list_tile.dart';
import 'package:captrans_regulateur/receveur/search_receveur_param.dart';
import 'package:captrans_regulateur/repository/receveur/receveur_dis_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/ui/croquis/list_croquis.dart';
class SearchReceveurPageArg extends StatelessWidget {
  static const routeName="/cotisation/search_receveur_arg";

  const SearchReceveurPageArg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchReceveurParam param = ModalRoute.of(context)!.settings.arguments as SearchReceveurParam;
    return SearchReceveurPage(
      onSelect: param.onSelect,
    );
  }
}


class SearchReceveurPage extends StatefulWidget {
  static const routeName="/cotisation/search_receveur";
  final Function(Receveur)  onSelect;

  const SearchReceveurPage( { required this.onSelect,Key? key}) : super(key: key);

  @override
  State<SearchReceveurPage> createState() => _SearchReceveurPageState();
}

class _SearchReceveurPageState extends State<SearchReceveurPage> {
  TextEditingController _controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReceveurSearchBloc>(
      create: (context)=>ReceveurSearchBloc(receveurDisRepo: context.read<ReceveurDisRepo>()),
      child: Scaffold(

        appBar: AppBar(
          titleSpacing: 0,
          elevation: 2,
          title: BlocBuilder<ReceveurSearchBloc,ReceveurSearchState>(
            builder: (context,state){
              return _searchInput() ;
            },
          ) ,
          actions: [
            IconButton(
                onPressed: (){
                },
                icon: Icon(Icons.person_add))
          ],
        ),
        body: BlocBuilder<ReceveurSearchBloc,ReceveurSearchState>(
          builder: (context,state){
            if(state.receveurs.length==0 && state.status ==  ReceveurSearchStatus.loading){
              return infoPage() ;
            }
            return ListView.builder(
              itemBuilder: (context,index){
                if(state.status == ReceveurSearchStatus.loading && index == state.receveurs.length){
                  return CircularProgressIndicator();
                }
                else{
                  return ReceveurListTile(
                    receveur: state.receveurs[index],
                    onPressed: (){
                      widget.onSelect!(state.receveurs[index]);
                    },
                  );
                }
              },
              itemCount:(state.status==ReceveurSearchStatus.loading) ?state.receveurs.length+1 : state.receveurs.length,
            );
          },
        )
      ),
    );
  }
  Widget infoPage(){
    Color color=Colors.grey.shade300;
    return Center(
        child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                  children:<Widget>[
                    Icon(Icons.search,color:color,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:8.0,vertical:0),
                      child:  Text('ou',style: TextStyle(color: color),),
                    ),
                    Icon(Icons.person_add,color: color,),
                  ]
              ),
              const SizedBox(height: 10,),
              Text("Chercher un receveur en saissisant son nom ou son numero de téléphone dans la barre de recherche en haut. Si le receveur n'existe pas ajouter le an cliquantt sur le butonn ajout en haut à droite",
                style: TextStyle(color: color),
              ),
            ]
        )
    );
  }
  Widget _searchInput(){
    return Container(
      margin: EdgeInsets.only(right: 15),
      padding: EdgeInsets.symmetric(horizontal:30 , ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      alignment: Alignment.center,
      height: 35,
      child: TextField(

        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Recherche receveur',
           // prefixIcon: Icon(Icons.search),
            //suffixIcon: Icon(Icons.person_search)
          ),
        ),
      );

  }
}
