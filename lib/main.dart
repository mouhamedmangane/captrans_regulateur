import 'package:captrans_regulateur/bloc/cotisation/addcotisation/add_cotisation_bloc.dart';
import 'package:captrans_regulateur/bloc/main/app_start_bloc.dart';
import 'package:captrans_regulateur/bus/search_bus_page.dart';
import 'package:captrans_regulateur/cotisation/add_cotisation/add_montant_cotisation_page.dart';
import 'package:captrans_regulateur/cotisation/add_cotisation/search_bus_by_mat_page.dart';
import 'package:captrans_regulateur/cotisation/cotisation_page.dart';
import 'package:captrans_regulateur/my_app.dart';
import 'package:captrans_regulateur/receveur/save_receveur_page.dart';
import 'package:captrans_regulateur/receveur/search_receveur_page.dart';
import 'package:captrans_regulateur/receveur/select_receveur_page.dart';
import 'package:captrans_regulateur/repository/bus/bus_dis_repo.dart';
import 'package:captrans_regulateur/repository/bus/bus_repo.dart';
import 'package:captrans_regulateur/repository/cotisation/cotisation_dis_repo.dart';
import 'package:captrans_regulateur/repository/cotisation/cotisation_repo.dart';
import 'package:captrans_regulateur/repository/receveur/receveur_dis_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppStartBloc(false)..load(),
      child: BlocBuilder<AppStartBloc,bool>(
          builder: (context,state) {
            return (state)
                ? const App()
                : const DemarragePage();
          }
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

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
        RepositoryProvider<ReceveurDisRepo>(
          create:(context)=>ReceveurDisRepo(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context)=>AddCotisationBloc(context.read<CotisationRepo>())
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          //home: MyHomePage(),
          initialRoute:MyHomePage.routeName ,
          routes: {
            MyHomePage.routeName:(context)=>MyHomePage(),
            SearchBusByMatPage.routeName:(context)=>SearchBusByMatPage(),
            SearchBusPageArg.routeName:(context)=>SearchBusPageArg(),
            SelectReceveurPage.routeName:(context)=>SelectReceveurPage(),
            SearchReceveurPageArg.routeName:(context)=>SearchReceveurPageArg(),
            SaveReceveurPageArg.routeName:(context)=>SaveReceveurPageArg(),
            AddMontantCotisationPage.routeName:(context)=>AddMontantCotisationPage(),
            CotisationPageArgs.routeName:(context) => CotisationPageArgs(),
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
              'asset/logo.jpg',
              width: 200,
          ),
       )
    );
  }
}


