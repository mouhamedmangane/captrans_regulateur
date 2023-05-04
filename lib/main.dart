import 'package:captrans_regulateur/bloc/cotisation/addcotisation/add_cotisation_bloc.dart';
import 'package:captrans_regulateur/bloc/fcm/fcm_bloc.dart';
import 'package:captrans_regulateur/bloc/main/app_material_bloc.dart';
import 'package:captrans_regulateur/bloc/main/app_start_bloc.dart';
import 'package:captrans_regulateur/notification_fcm/center_np.dart';
import 'package:captrans_regulateur/notification_fcm/line_np_new_collecte.dart';
import 'package:captrans_regulateur/service/bluetooth_service.dart';
import 'package:captrans_regulateur/bus/search_bus_page.dart';
import 'package:captrans_regulateur/collect/collect_qr_code_page.dart';
import 'package:captrans_regulateur/collect/d%C3%A9tail_collect_page.dart';
import 'package:captrans_regulateur/connexion/derevouillage_page.dart';
import 'package:captrans_regulateur/cotisation/add_cotisation/add_montant_cotisation_page.dart';
import 'package:captrans_regulateur/bus/search_bus_by_mat_page.dart';
import 'package:captrans_regulateur/cotisation/cotisation_page.dart';
import 'package:captrans_regulateur/my_app.dart';
import 'package:captrans_regulateur/print/print_page.dart';
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
import 'package:captrans_regulateur/service/print_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:noppal_util/conf/env.dart';

import 'bloc/cotisation/cotisation_en_cours_bloc.dart';
import 'bloc/cotisation/total_cotisation_bloc.dart';
import 'connexion/connexion_page.dart';
import 'notification_fcm/key_fcm.dart';


late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
CenterNp centerNp=CenterNp(lines: [
  LineNpNewCollecte(KeyFcm.NOUVEAU_COLLECTE),
]);

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
  centerNp.makeBack(message);
}


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
  runApp(const MyApp());
}

Future<void> saveTokenToDB(String token) async{
  int idUser=MyConf.getValue(MyConfConstUser.ID_KEY);
  UserDisRepo().saveTokenFcm(idUser, token);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context)=>AppStartBloc(0)..load()
        ),
        BlocProvider<FcmBloc>(
          create: (context)=>FcmBloc(),
        )
      ],
      child: BlocBuilder<AppStartBloc,int>(
          builder: (context,state) {
            return (state!=0)
                ?  App()
                : const DemarragePage();
          }
      ),
    );
  }
}





class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  void _traitementFcm(RemoteMessage event){
    print(event.data);

    RemoteNotification? notification = event.notification;

    AndroidNotification? android = event.notification?.android;

    if (notification != null && android != null && !kIsWeb) {
      centerNp.makeFront(event);
      context.read<FcmBloc>().add(
          FcmArrived(
              title:notification.title,
              message:notification.body,
              data:event.data
      ));

    }
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
     _traitementFcm(event);

    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print('ontMessageOpenedApp-----------------------------------------');
      RemoteNotification? notification = event.notification;
      if (notification != null  && !kIsWeb)
        context.read<FcmBloc>().add(
          FcmArrived(
              title:notification.title,
              message:notification.body,
              data:event.data
      ));
    });

  }


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
        RepositoryProvider<BluetoothService>(
          create: (context)=>BluetoothService(),
        ),
        RepositoryProvider<PrintService>(
            create: (context)=>PrintService(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AppMaterialBloc>(
            create: (context)=>AppMaterialBloc((AppMaterialStatus.connexion)),
          ),
        ],
        child: BlocBuilder<AppMaterialBloc,AppMaterialStatus>(
          builder: (context,state){
            if(state == AppMaterialStatus.home) {
              return const AppBody();
            }
            return BlocBuilder<AppStartBloc,int>(

              builder:(context,state){
                return AppAuth(state);
              }
            );
          },
        )
      ),
    ) ;
  }
}


class AppAuth extends StatelessWidget {
  final int hasConnected;
  const AppAuth(this.hasConnected,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: MyHomePage(),
      initialRoute:(hasConnected==2)?DeverouillagePage.routeName: ConnexionPage.routeName,
      routes: {
        ConnexionPage.routeName:(context)=> ConnexionPage(),
        DeverouillagePage.routeName:(context)=>DeverouillagePage(),
      }
    );
  }
}



class AppBody extends StatefulWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  Future<void> setupToken()async{
    String ? token= await FirebaseMessaging.instance.getToken();
    print("token genered : $token");
    if(token!=null){
      await saveTokenToDB(token);
    }
    FirebaseMessaging.instance.onTokenRefresh.listen(saveTokenToDB);
  }

  @override
  void initState() {
    super.initState();

    setupToken();
  }

  Widget wrapRoute(Widget widget){
    return BlocListener<FcmBloc,FcmState>(
      listener: (context,state){
        if(state.data!=null){
          print('tanter navigation --------------------------------------');
          if(state.data!['name']==KeyFcm.NOUVEAU_COLLECTE){
            Navigator.popUntil(context, (route) => route.settings.name == MyHomePage.routeName);
          }

        }
      },
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FcmBloc,FcmState>(
      listener: (context,fcmState)async{
        if(fcmState.data != null){
          if(fcmState.data!['name']==KeyFcm.DEVEROUILLAGE){
            await context.read<AppStartBloc>().change(1);
            context.read<AppMaterialBloc>().change(AppMaterialStatus.connexion);
          }
        }
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context)=>AddCotisationBloc(context.read<CotisationRepo>())
          ),
          BlocProvider<TotalCotisationBloc>(
            create: (context) => TotalCotisationBloc(context.read<CotisationRepo>())..load(),
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

          initialRoute:MyHomePage.routeName,
          routes: {
            MyHomePage.routeName:(context)=>wrapRoute(const MyHomePage()),
            CollectQrCodePage.routeName:(context)=>wrapRoute(const CollectQrCodePage()),
            SearchBusByMatPage.routeName:(context)=>wrapRoute(const SearchBusByMatPage()),
            SearchBusPageArg.routeName:(context)=>wrapRoute(const SearchBusPageArg()),
            SelectReceveurPage.routeName:(context)=>wrapRoute(const SelectReceveurPage()),
            SearchReceveurPageArg.routeName:(context)=>wrapRoute(const SearchReceveurPageArg()),
            SaveReceveurPageArg.routeName:(context)=>wrapRoute(SaveReceveurPageArg()),
            AddMontantCotisationPage.routeName:(context)=>wrapRoute(const AddMontantCotisationPage()),
            CotisationPageArgs.routeName:(context) => wrapRoute(const CotisationPageArgs()),
            DetailCollectPageArg.routeName:(context) => wrapRoute(DetailCollectPageArg()),
            PrintPage.routeName:(context)=>wrapRoute(PrintPage())
          },
        ),
      ),
    );
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


