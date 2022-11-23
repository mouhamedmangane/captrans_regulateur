import 'package:captrans_regulateur/bloc/collect/collect_detait_bloc.dart';
import 'package:captrans_regulateur/collect/liste_collect_item.dart';
import 'package:captrans_regulateur/cotisation/cotisation_page.dart';
import 'package:captrans_regulateur/cotisation/list_cotisation_s_view.dart';
import 'package:captrans_regulateur/model/collect.dart';
import 'package:captrans_regulateur/repository/collect/collect_repo.dart';
import 'package:captrans_regulateur/repository/cotisation/cotisation_repo.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ui/button/error_body_smal_view.dart';

class DetailCollectParam{
  Collect collect;
  DetailCollectParam({required this.collect});
}

class DetailCollectPageArg extends StatelessWidget{
  static const routeName="/collect/detail_arg";

  Widget build (BuildContext context){
    DetailCollectParam param=ModalRoute.of(context)!.settings.arguments as DetailCollectParam;
    return DetailCollectPage(
      collect: param.collect,
    );
  }
}

class DetailCollectPage extends StatelessWidget {

  final Collect collect;

  const DetailCollectPage({required this.collect,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CollectDetailBloc(collectRepo: context.read<CollectRepo>(), cotisationRepo: context.read<CotisationRepo>())..add(CollectDetailLoad(collect)),
      child:DetailCollectView(collect: collect)
    );
  }
}

class DetailCollectView extends StatelessWidget {
  final Collect collect;
   const DetailCollectView({required this.collect,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collect N°${collect.id}'),
        elevation: 2,
        titleSpacing: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0,right:15),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ListeCollectItem(
                  collect,
                  zeroContentPadding: true,
                  ),
              ),
            ),
            BlocBuilder<CollectDetailBloc,CollectDetailState>(
              builder: (context,state){
                String taille='...';
                if(state.status == CollectDetailStatus.success){
                  taille="${state.cotisations.length}";
                }
                return SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0,),
                    child: Text('Cotisations ( ${taille} ) ',style: TextStyle(
                      //decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),),
                  ),
                );
              },
            ),
            DetailBusListCotisation(collect: collect),

          // DetailBusListCotisation(),
          ],
        ),
      ),
    );
  }




}

class DetailBusListCotisation extends StatelessWidget {
  final Collect collect;
  const DetailBusListCotisation({required this.collect,Key ? key}):super(key: key);

  Widget build(BuildContext context){
    return BlocBuilder<CollectDetailBloc,CollectDetailState>(
      builder: (context,state){
        print('passer');
        if(state.status == CollectDetailStatus.loading || state.status ==CollectDetailStatus.init){
          return _loading();
        }
        else if(state.status == CollectDetailStatus.error){
          return _error(context,state.message!);
        }
        else{
          return ListeCotisationSView(
            cotisations: state.cotisations,
            onTap: (context,cotisation){
              Navigator.pushNamed(context, CotisationPageArgs.routeName,arguments: CotisationParam(
                cotisation: cotisation!,
                mustCompleted: true,
              ));
            },
          );

      }
    });
  }

  Widget _loading(){
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 60),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _error(BuildContext context,String message){
    return SliverToBoxAdapter(
      child: ErrorBodySmallView(
        topPadding: 20,
        onTap: (){
          context.read<CollectDetailBloc>().add(CollectDetailComplete(collect));
        },
        title: 'Echec chargment liste cotisation',
        message: message!
      )
    );
  }



}


