import 'package:captrans_regulateur/bloc/collect/collect_list_bloc.dart';
import 'package:captrans_regulateur/bloc/fcm/fcm_bloc.dart';
import 'package:captrans_regulateur/collect/collect_qr_code_page.dart';
import 'package:captrans_regulateur/collect/d%C3%A9tail_collect_page.dart';
import 'package:captrans_regulateur/collect/liste_collect.dart';
import 'package:captrans_regulateur/model/collect.dart';
import 'package:captrans_regulateur/repository/collect/collect_repo.dart';
import 'package:captrans_regulateur/ui/button/error_body_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/bloc/enum_loadable_state.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';

import '../notification_fcm/key_fcm.dart';

class CollectBody extends StatelessWidget {
  const CollectBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CollectListBloc>(
      create:(context) => CollectListBloc(collectRepo:context.read<CollectRepo>())..load(),
      child: const CollectBodyView(),
    );
  }
}


class CollectBodyView extends StatelessWidget {
  const CollectBodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text('Collectes',),
              elevation: 0,
              scrolledUnderElevation: 1,
              backgroundColor: Colors.grey.shade50,
              foregroundColor: Colors.black,
              actions: [
                IconButton(
                    onPressed: (){
                      Navigator.pushNamed(context, CollectQrCodePage.routeName);
                    },
                    icon: Icon(Icons.qr_code_outlined,color: Colors.blue)
                ),
              ],
            ),
            body:BlocListener<FcmBloc,FcmState>(
              listener: (context,fcmState){
                print('2tesssssssssssst');
                if(fcmState.data != null)
                  if(fcmState.data!['name'] == KeyFcm.NOUVEAU_COLLECTE){
                    print('niccccccccccccccccccccccce');
                    context.read<CollectListBloc>().load();
                  }
              },
              child:  RefreshIndicator(
                  onRefresh: ()async{
                    context.read<CollectListBloc>().load();
                  },


                child: BlocBuilder<CollectListBloc,SimpleLoadableState<List<Collect>>>(
                    builder:(context,state){
                      print('ajoterrrrrrrrrrrrrrr');

                      if(state.state == EnumLoadableState.LOADING){
                        return loading();
                      }
                      else if (state.state == EnumLoadableState.ERROR){
                        return error(context,state.message!);
                      }
                      else if(state.value!.isEmpty){
                        return _emptyList(context);
                      }
                      return ListeCollect(
                          collects: state.value!,
                          onSelect: (context,collect){
                            Navigator.pushNamed(
                                context,
                                DetailCollectPageArg.routeName,
                                arguments: DetailCollectParam(collect: collect)
                            );
                          }
                      );
                    }
                ),
              ),
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
  
  Widget _emptyList(BuildContext context){
    return  RefreshIndicator(
      onRefresh: ()async{
        context.read<CollectListBloc>().load();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 250,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children:[
                    Icon(Icons.library_books_outlined,color: Colors.grey.shade400,size: 75,),
                    SizedBox(height: 15,),
                    Text("Aucune collecte enregistrée",style: TextStyle(color: Colors.grey.shade500),),
            ]),
          ),
        ),
      ),
    );
  }

}
