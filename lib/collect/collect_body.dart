import 'package:captrans_regulateur/bloc/collect/collect_list_bloc.dart';
import 'package:captrans_regulateur/collect/d%C3%A9tail_collect_page.dart';
import 'package:captrans_regulateur/collect/liste_collect.dart';
import 'package:captrans_regulateur/model/collect.dart';
import 'package:captrans_regulateur/repository/collect/collect_repo.dart';
import 'package:captrans_regulateur/ui/button/error_body_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/bloc/enum_loadable_state.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';

class CollectBody extends StatelessWidget {
  const CollectBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CollectListBloc>(
      create:(context) => CollectListBloc(collectRepo:context.read<CollectRepo>())..load(),
      child: Scaffold(
          appBar: AppBar(
            title: Text('Collectes',),
            elevation: 0,
            scrolledUnderElevation: 1,
            backgroundColor: Colors.grey.shade50,
            foregroundColor: Colors.black,
            actions: [
              IconButton(
                  onPressed: (){
                  },
                  icon: Icon(Icons.qr_code_outlined,color: Colors.blue)
              ),
            ],
          ),
          body:
              BlocBuilder<CollectListBloc,SimpleLoadableState<List<Collect>>>(
                builder:(context,state){
                  if(state.state == EnumLoadableState.LOADING){
                    return loading();
                  }
                  else if (state.state == EnumLoadableState.ERROR){
                    return error(context,state.message!);
                  }
                  return ListeCollect(
                      onSelect: (context,collect){
                        print('ajoterrrrrrrrrrrrrrr');
                        Navigator.pushNamed(
                            context,
                            DetailCollectPageArg.routeName,
                            arguments: DetailCollectParam(collect: collect)
                        );
                      }
                  );
                }
              )

        )
    );
  }

  Widget loading(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget error(BuildContext context,String message){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: ErrorBodyView(
          onTap: (){
            context.read<CollectListBloc>().load();
          },
          title:'Echec Chargement',
          message: message
      ),
    );
  }


}
