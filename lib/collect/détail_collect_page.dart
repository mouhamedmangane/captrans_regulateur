import 'package:captrans_regulateur/bloc/collect/collect_detait_bloc.dart';
import 'package:captrans_regulateur/collect/liste_collect_item.dart';
import 'package:captrans_regulateur/cotisation/cotisation_page.dart';
import 'package:captrans_regulateur/model/collect.dart';
import 'package:captrans_regulateur/repository/collect/collect_repo.dart';
import 'package:captrans_regulateur/repository/cotisation/cotisation_repo.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cotisation/list_cotisation_s_item_view.dart';
import '../ui/button/error_body_smal_view.dart';

class DetailCollectParam{
  final Collect collect;
  const DetailCollectParam({required this.collect});
}

class DetailCollectPageArg extends StatelessWidget{
  static const routeName="/collect/detail_arg";

  const DetailCollectPageArg({super.key});

  @override
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
    return BlocProvider<CollectDetailBloc>(
      create: (context) => CollectDetailBloc(collectRepo: context.read<CollectRepo>(), cotisationRepo: context.read<CotisationRepo>())..add(CollectDetailLoad(collect)),
      child:DetailCollectView(collect: collect)
    );
  }
}

class DetailCollectView extends StatefulWidget {

  final Collect collect;
   const DetailCollectView({required this.collect,Key? key}) : super(key: key);

  @override
  State<DetailCollectView> createState() => _DetailCollectViewState();
}

class _DetailCollectViewState extends State<DetailCollectView> {
  final ScrollController _scrollController=ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        CollectDetailBloc bloc= BlocProvider.of<CollectDetailBloc>(context);
        if(bloc.state.status != CollectDetailStatus.loadingAdd && !bloc.state.cotisations.isLimit()) {
          bloc.add(CollectDetailNextPage());
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collect N°${widget.collect.id}'),
        elevation: 2,
        titleSpacing: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0,right:15),
        child: RefreshIndicator(
          onRefresh: ()async{
            context.read<CollectDetailBloc>().add(CollectDetailLoad(widget.collect));
          },
          child: CustomScrollView(
            controller: _scrollController,
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              SliverToBoxAdapter(
                child:  Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ListeCollectItem(
                    widget.collect,
                    zeroContentPadding: true,
                    ),
                ),
              ),
              BlocBuilder<CollectDetailBloc,CollectDetailState>(
                builder: (context,state){
                  String taille='...';
                  if(state.status == CollectDetailStatus.success){
                    taille="${state.cotisations.total}";
                  }
                  return SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0,),
                      child: Text('Cotisations ( $taille ) ',style: TextStyle(
                        //decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.grey.shade600,
                      ),),
                    ),
                  );
                },
              ),

              DetailBusListCotisation(collect: widget.collect),

            // DetailBusListCotisation(),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailBusListCotisation extends StatelessWidget {
  final Collect collect;
  const DetailBusListCotisation({required this.collect,Key ? key}):super(key: key);

  @override
  Widget build(BuildContext context){
    return BlocBuilder<CollectDetailBloc,CollectDetailState>(
        builder: (context,state){
          if(state.status == CollectDetailStatus.loading || state.status ==CollectDetailStatus.init){
            return _loading();
          }
          else if(state.status == CollectDetailStatus.error){
            return _error(context,state.message);
          }
          else{
            return SliverFixedExtentList(
                itemExtent: 60,
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context,int index){
                    if(index == state.cotisations.data.length){
                      if(state.status == CollectDetailStatus.loadingAdd) {
                        return Container(
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator(),
                        );
                      } else if(state.status == CollectDetailStatus.errorAdd) {
                        return Center(child: SizedBox(height:75,child: Text(state.message)));
                      } else {
                        return const Center(child: Text('Error inconnue,veillez actualiser'),);
                      }
                    }
                    else{
                      return ListeCotisationSItemView(
                          onTap:(context,cotisation){
                            Navigator.pushNamed(context, CotisationPageArgs.routeName,arguments: CotisationParamWithCotisation(
                              cotisation: cotisation,
                            ));
                          },
                          state.cotisations.data[index]
                      );
                    }

                  },
                  childCount:(state.status==CollectDetailStatus.success)
                      ? state.cotisations.data.length : state.cotisations.data.length+1,

                )
            );

          }

        });
  }

  Widget _loading(){
    return const SliverToBoxAdapter(
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
          context.read<CollectDetailBloc>().add(CollectDetailLoad(collect));
        },
        title: 'Echec chargment liste cotisation',
        message: message
      )
    );
  }



}


