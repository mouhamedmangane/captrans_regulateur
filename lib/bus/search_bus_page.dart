import 'package:captrans_regulateur/bloc/bus/search/bus_search_bloc.dart';
import 'package:captrans_regulateur/bus/bus_list_tile.dart';
import 'package:captrans_regulateur/bus/search_bus_param.dart';
import 'package:captrans_regulateur/model/bus.dart';
import 'package:captrans_regulateur/repository/bus/bus_repo.dart';
import 'package:captrans_regulateur/ui/button/error_body_view.dart';
import 'package:captrans_regulateur/ui/input/input_search_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBusPageArg extends StatelessWidget {
  static const routeName="/cotisation/search_buss_arg";

  const SearchBusPageArg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchBusParam param = ModalRoute.of(context)!.settings.arguments as SearchBusParam;
    return SearchBusPage(
      onSelect: param.onSelect,
    );
  }
}

class SearchBusPage extends StatelessWidget {
  static const routeName="/cotisation/search_buss";
  final Function(BuildContext,Bus)  onSelect;
  const SearchBusPage({required this.onSelect,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BusSearchBloc>(
      create: (context)=>BusSearchBloc(busRepo: context.read<BusRepo>()),
      child: SearchBusView(onSelect: onSelect,),
    );
  }
}


class SearchBusView extends StatefulWidget {
  final Function(BuildContext,Bus)  onSelect;
  const SearchBusView( { required this.onSelect,Key? key}) : super(key: key);
  @override
  State<SearchBusView> createState() => _SearchBusViewState();
}

class _SearchBusViewState extends State<SearchBusView> {
  TextEditingController _controller=TextEditingController();
  ScrollController _scrollController = ScrollController();
  bool editing=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        BusSearchBloc bloc= BlocProvider.of<BusSearchBloc>(context);
        if(bloc.state.status != BusSearchStatus.loadingAdd && bloc.state.page<bloc.state.maxPage)
          bloc.add(BusSearchOnAdded());
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          elevation: 2,
          title: BlocBuilder<BusSearchBloc,BusSearchState>(
            builder: (context,state){
              return _searchInput(context) ;
            },
          ) ,
          actions: [

          ],
        ),
        body: BlocBuilder<BusSearchBloc,BusSearchState>(
          builder: (context,state){
            print(state.status);
            if(state.status ==  BusSearchStatus.error)
              return _errorView(context,state);
            else if(state.status ==  BusSearchStatus.init)
              return _infoPage() ;
            else if(state.status == BusSearchStatus.loading)
              return _loadingInit();
            else
              return _listBus(state);
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
                Text("Chercher un buss en saisissant son nom ou son numero de téléphone dans la barre de recherche en haut. Si le buss n'existe pas ajouter le an cliquant sur le bouton ajout en haut à droite",
                  style: TextStyle(color: color,fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ]
          ),
        )
    );
  }



  Widget _searchInput(BuildContext context){
    return Container(
      height: 40,
      margin: EdgeInsets.only(right: 10),
      alignment: Alignment.center,
      child: InputSearchHeader(
        controller: _controller,
        hintText: "Rechercher Bus",
        onChange: (text){
            if(context.read<BusSearchBloc>().state.search!=text)
              context.read<BusSearchBloc>().add(BusSearchLoad(search: text));
            },
      ),
    );

  }

  Widget _loadingInit(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _errorView(BuildContext context,BusSearchState state){
    return ErrorBodyView(
      onTap: (){
        context.read<BusSearchBloc>().add(BusSearchLoad(search: _controller.text));
      },
      title: "Data Faillure",
      message: state.message??'',

    ) ;
  }

  Widget _listBus(BusSearchState state){
    return  ListView.builder(

      controller: _scrollController,
      itemBuilder: (context,index){
        if(index == state.buss.length){
          if(state.status == BusSearchStatus.loadingAdd)
            return Center(child: CircularProgressIndicator());
          else if(state.status == BusSearchStatus.errorAdd)
            return Center(child: SizedBox(height:75,child: Text("${state.message}")));
          else
            return Center(child: Text('Erroe inconnue,veillez actualiser'),);
        }
        else{
          return BusListTile(
            bus: state.buss[index],
            onPressed: (context,bus){
              widget.onSelect!(context,bus);
            },
          );
        }
      },
      itemCount:(state.status==BusSearchStatus.done)
          ? state.buss.length
          : state.buss.length+1,
    );
  }
}
