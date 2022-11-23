

import 'package:captrans_regulateur/bloc/cotisation/addcotisation/add_cotisation_bloc.dart';
import 'package:captrans_regulateur/bloc/bus/search_by_mat/search_bus_by_mat_bloc.dart';
import 'package:captrans_regulateur/model/bus.dart';
import 'package:captrans_regulateur/repository/bus/bus_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBusByMatParam{
  final String matricule;
  final Function(BuildContext,Bus) onValidate;
  final bool canRescan;
  const SearchBusByMatParam({ required this.matricule, required this.onValidate,this.canRescan=false});
}

class SearchBusByMatPage extends StatelessWidget {
  static const routeName="/cotisation/search_bus/by_mat";

  const SearchBusByMatPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SearchBusByMatParam param = ModalRoute.of(context)!.settings.arguments as SearchBusByMatParam;
    return BlocProvider<SearchBusByMatBloc>(
      create: (ct)=>SearchBusByMatBloc(busRepo: ct.read<BusRepo>())..add(SearchBusByMatCharger(param.matricule)),
      child: SearchBusByMatView(onValidate: param.onValidate,canRescan: param.canRescan,),
    );
  }
}

class SearchBusByMatView extends StatelessWidget {
  final Function(BuildContext,Bus) onValidate;
  final bool canRescan;
  const SearchBusByMatView({required this.onValidate,this.canRescan=false,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
       title:  Text('Recherche bus par matricule'),
       titleSpacing: 0,
        elevation: 1,
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 50,horizontal: 15),
          child: Stack(
              children:[
                Align(
                  alignment: Alignment.topCenter,
                  child: Chip(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                    label: Row(
                        crossAxisAlignment:  CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.bus_alert,size: 35,color: Colors.blue,),
                          SizedBox(width: 4,),
                          BlocBuilder<SearchBusByMatBloc,SearchBusByMatState>(
                            buildWhen: (previous,current) => previous.matricule != current.matricule,
                            builder: (context,state) =>
                                Text("${state.matricule}",style: TextStyle(fontSize: 32,color: Colors.blue),textAlign: TextAlign.center,),
                          ),
                        ],
                      ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: BlocConsumer<SearchBusByMatBloc,SearchBusByMatState>(
                      listener: (contextt,state){
                        if(state.status == SearchBusByMatStatus.success){
                          BlocProvider.of<AddCotisationBloc>(context).add(AddCotisationSelectedBus(state.bus!));
                          onValidate(contextt,state.bus!);
                        }

                      },
                      builder: (context,state) {
                          if(state.status == SearchBusByMatStatus.failureTreatement || state.status == SearchBusByMatStatus.failureRequest)
                            return  echec(state,context);
                          else return progresse();
                      }
                  ),
                ),
              ])
      ),
    );


  }

  Widget echec(SearchBusByMatState state,BuildContext context){
      return Padding(
        padding: const EdgeInsets.only(left: 30.0,right: 30,bottom: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(state.status==SearchBusByMatStatus.failureRequest?Icons.wifi_tethering_error:Icons.phonelink_erase_rounded,size: 75,color: Colors.grey.shade400,),
              SizedBox(height: 10,),
              Text("Echec Recherche",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.grey.shade600)),
              SizedBox(height: 5,),
              Text(state.message,style: TextStyle(fontSize: 16,color: Colors.grey.shade600),textAlign: TextAlign.center),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if(canRescan)...[
                    ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                //side: BorderSide()
                              )
                          )
                      ),
                      onPressed:(){
                      },
                      child: Row(
                        children: [
                          Icon(Icons.qr_code_outlined),
                          Text(" Réscanner"),
                        ],
                      ),
                    ),
                  ],
                  ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              //side: BorderSide()
                            )
                        )
                    ),
                    onPressed:(){
                      BlocProvider.of<SearchBusByMatBloc>(context).add(SearchBusByMatCharger((state.matricule)));
                    },
                    child: Row(
                      children: [
                        Icon(Icons.replay),
                        Text(" Réessayer"),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
      );
  }

  Widget progresse(){
    return Container(
        width: 150,
        height: 150,
        child: CircularProgressIndicator(strokeWidth: 4,)
    );
  }

}
