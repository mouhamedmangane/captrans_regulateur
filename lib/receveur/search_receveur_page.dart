import 'package:captrans_regulateur/bloc/receveur/search/receveur_search_bloc.dart';
import 'package:captrans_regulateur/model/receveur.dart';
import 'package:captrans_regulateur/receveur/receveur_list_tile.dart';
import 'package:captrans_regulateur/receveur/save_receveur_page.dart';
import 'package:captrans_regulateur/receveur/search_receveur_param.dart';
import 'package:captrans_regulateur/repository/receveur/receveur_dis_repo.dart';
import 'package:captrans_regulateur/ui/button/error_body_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/ui/bounce/npl_tap_bounce.dart';

import '../ui/input/input_search_header.dart';

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

class SearchReceveurPage extends StatelessWidget {
  static const routeName="/cotisation/search_receveur";
  final Function(BuildContext,Receveur)  onSelect;
  const SearchReceveurPage({required this.onSelect,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReceveurSearchBloc>(
        create: (context)=>ReceveurSearchBloc(receveurDisRepo: context.read<ReceveurDisRepo>()),
        child: SearchReceveurView(onSelect: onSelect,),
    );
  }
}


class SearchReceveurView extends StatefulWidget {
  final Function(BuildContext,Receveur)  onSelect;
  const SearchReceveurView( { required this.onSelect,Key? key}) : super(key: key);
  @override
  State<SearchReceveurView> createState() => _SearchReceveurViewState();
}

class _SearchReceveurViewState extends State<SearchReceveurView> {
  TextEditingController _controller=TextEditingController();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
        if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
          ReceveurSearchBloc bloc= BlocProvider.of<ReceveurSearchBloc>(context);
          if(bloc.state.status != ReceveurSearchStatus.loadingAdd && bloc.state.page<bloc.state.maxPage)
            bloc.add(ReceveurSearchOnAdded());
        }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 2,

        title: BlocBuilder<ReceveurSearchBloc,ReceveurSearchState>(
          builder: (context,state){
            return _searchInput(context) ;
          },
        ) ,
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pushNamed(
                    context,
                    SaveReceveurPageArg.routeName,
                    arguments: _paramSaveReceveur(),
                );
              },
              icon: Icon(Icons.person_add),)
        ],
      ),
      body: BlocBuilder<ReceveurSearchBloc,ReceveurSearchState>(
        builder: (context,state){
          print(state.status);
          if(state.status ==  ReceveurSearchStatus.error)
            return _errorView(context,state);
          else if(state.status ==  ReceveurSearchStatus.init)
            return _infoPage() ;
          else if(state.status == ReceveurSearchStatus.loading)
            return _loadingInit();
          else if(state.status == ReceveurSearchStatus.done && state.receveurs.length==0)
            return  _doneAndNoData(context);
          else
            return _listReceveur(state);
        },
      )
    );
  }
  Widget _infoPage(){
    Color color=Colors.grey.shade500;
    return Center(
        child:Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                    children:<Widget>[
                      Icon(Icons.person_search_outlined,color:color,size: 80,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:8.0,vertical:0),
                        child:  Text('ou',style: TextStyle(color: color,fontSize: 24),),
                      ),
                      Icon(Icons.person_add_outlined,color: color,size: 80,),
                    ]
                ),
                const SizedBox(height: 15,),
                Text("Chercher un receveur en saisissant son nom ou son numero de téléphone dans la barre de recherche en haut. Si le receveur n'existe pas ajouter le an cliquant sur le bouton ajout en haut à droite",
                  style: TextStyle(color: color,fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ]
          ),
        )
    );
  }

  SaveReceveurParam _paramSaveReceveur(){
    return SaveReceveurParam(
        onValidate: (context,receveur){
      widget.onSelect(context,receveur);
    });
  }

  Widget _searchInput(BuildContext context){
    return Container(
      height: 40,
      alignment: Alignment.center,
      child: InputSearchHeader(
        hintText: 'Recherche receveur',
        controller: _controller,
        onChange: (text){
          if(context.read<ReceveurSearchBloc>().state.search!=text)
            context.read<ReceveurSearchBloc>().add(ReceveurSearchLoad(search: text));
        },

        ),
      );

  }
  Widget _doneAndNoData(BuildContext context){
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        children: [
          const ListTile(
            title: Text('Ancun Resultat'),
          ),
          NplTapBounce(
            child: const ListTile(
              title: Text('Nouveau Receveur'),
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.person_add),
                radius: 30,
              ) ,
            ),
            onTap: (){
              Navigator.pushNamed(context, SaveReceveurPageArg.routeName,arguments: _paramSaveReceveur());
            },
          ),

        ],
      ),
    );
  }
  Widget _loadingInit(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  Widget _errorView(BuildContext context,ReceveurSearchState state){
    return ErrorBodyView(
        onTap: (){
      context.read<ReceveurSearchBloc>().add(ReceveurSearchLoad(search: _controller.text));
    },
    title: "Data Faillure",
    message: state.message??'',

    ) ;
  }
  Widget _listReceveur(ReceveurSearchState state){
   return  ListView.builder(
     controller: _scrollController,
      itemBuilder: (context,index){
        if(index == state.receveurs.length){
          if(state.status == ReceveurSearchStatus.loadingAdd)
              return Center(child: CircularProgressIndicator());
          else if(state.status == ReceveurSearchStatus.errorAdd)
              return Center(child: SizedBox(height:75,child: Text("${state.message}")));
          else
            return Center(child: Text('Erroe inconnue,veillez actualiser'),);
        }
        else{
          return ReceveurListTile(
            receveur: state.receveurs[index],
            onPressed: (context,receveur){
              widget.onSelect(context,receveur);
            },
          );
        }
      },
      itemCount:(state.status==ReceveurSearchStatus.done)
                      ? state.receveurs.length
                      : state.receveurs.length+1,
    );
  }
}
