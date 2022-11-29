import 'package:captrans_regulateur/bloc/cotisation/addcotisation/add_cotisation_bloc.dart';
import 'package:captrans_regulateur/bloc/main/app_start_bloc.dart';
import 'package:captrans_regulateur/bus/search_bus_page.dart';
import 'package:captrans_regulateur/collect/collect_qr_code_page.dart';
import 'package:captrans_regulateur/collect/d%C3%A9tail_collect_page.dart';
import 'package:captrans_regulateur/connexion/derevouillage_page.dart';
import 'package:captrans_regulateur/cotisation/add_cotisation/add_montant_cotisation_page.dart';
import 'package:captrans_regulateur/bus/search_bus_by_mat_page.dart';
import 'package:captrans_regulateur/cotisation/cotisation_page.dart';
import 'package:captrans_regulateur/my_app.dart';
import 'package:captrans_regulateur/receveur/save_receveur_page.dart';
import 'package:captrans_regulateur/receveur/search_receveur_page.dart';
import 'package:captrans_regulateur/receveur/select_receveur_page.dart';
import 'package:captrans_regulateur/repository/app_local_repo.dart';
import 'package:captrans_regulateur/repository/bus/bus_dis_repo.dart';
import 'package:captrans_regulateur/repository/bus/bus_repo.dart';
import 'package:captrans_regulateur/repository/collect/collect_dis_repo.dart';
import 'package:captrans_regulateur/repository/collect/collect_repo.dart';
import 'package:captrans_regulateur/repository/cotisation/cotisation_dis_repo.dart';
import 'package:captrans_regulateur/repository/cotisation/cotisation_repo.dart';
import 'package:captrans_regulateur/repository/receveur/receveur_dis_repo.dart';
import 'package:captrans_regulateur/repository/user/user_dis_repo.dart';
import 'package:captrans_regulateur/repository/user/user_local_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/bloc/enum_loadable_state.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';

import 'bloc/cotisation/cotisation_en_cours_bloc.dart';
import 'bloc/cotisation/total_cotisation_bloc.dart';
import 'connexion/connexion_page.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppStartBloc(0)..load(),
      child: BlocBuilder<AppStartBloc,int>(
          builder: (context,state) {
            return (state!=0)
                ?  App(hasConnected: state,)
                : const DemarragePage();
          }
      ),
    );
  }
}

class App extends StatelessWidget {
  final int ?  hasConnected;
  const App({this.hasConnected,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CotisationRepo>(
          create:(context)=>CotisationDisRepo(),
        ),
        RepositoryProvider<BusRepo>(
          create:(context)=>BusDisRepo(),
        ),
        RepositoryProvider<CollectRepo>(
          create:(context)=>CollectDisRepo(),
        ),
        RepositoryProvider<ReceveurDisRepo>(
          create:(context)=>ReceveurDisRepo(),
        ),
        RepositoryProvider<UserDisRepo>(
          create:(context)=>UserDisRepo(),
        ),
        RepositoryProvider<UserLocalRepo>(
          create:(context)=>UserLocalRepo(),
        ),
        RepositoryProvider<AppLocalRepo>(
          create:(context)=>AppLocalRepo(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context)=>AddCotisationBloc(context.read<CotisationRepo>())
          ),
          BlocProvider<TotalCotisationBloc>(
            create: (context) => TotalCotisationBloc(SimpleLoadableState(value: 0,state: EnumLoadableState.INIT))..load(),
          ),
          BlocProvider<CotisationEnCoursBloc>(
            create: (context) => CotisationEnCoursBloc(context.read<CotisationRepo>())..load(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          //home: MyHomePage(),
          initialRoute:(hasConnected==2)?DeverouillagePage.routeName: ConnexionPage.routeName,
          routes: {
            ConnexionPage.routeName:(context)=> ConnexionPage(),
            DeverouillagePage.routeName:(context)=>DeverouillagePage(),
            MyHomePage.routeName:(context)=>MyHomePage(),
            CollectQrCodePage.routeName:(context)=>CollectQrCodePage(),
            SearchBusByMatPage.routeName:(context)=>SearchBusByMatPage(),
            SearchBusPageArg.routeName:(context)=>SearchBusPageArg(),
            SelectReceveurPage.routeName:(context)=>SelectReceveurPage(),
            SearchReceveurPageArg.routeName:(context)=>SearchReceveurPageArg(),
            SaveReceveurPageArg.routeName:(context)=>SaveReceveurPageArg(),
            AddMontantCotisationPage.routeName:(context)=>AddMontantCotisationPage(),
            CotisationPageArgs.routeName:(context) => CotisationPageArgs(),
            DetailCollectPageArg.routeName:(context) => DetailCollectPageArg()
          },
        ),
      ),
    ) ;
  }
}


class DemarragePage extends StatelessWidget {
  const DemarragePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: Image.asset(
              'asset/logo.png',
              width: 200,
          ),
       )
    );
  }
}


