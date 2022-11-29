import 'package:captrans_regulateur/connexion/connexion_page.dart';
import 'package:captrans_regulateur/repository/app_local_repo.dart';
import 'package:captrans_regulateur/repository/user/user_local_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/bloc/enum_loadable_state.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';

import '../bloc/user/deverouillage_bloc.dart';
import '../my_app.dart';

class DeverouillagePage extends StatelessWidget {

  static const String routeName="/deverouillage";

  DeverouillagePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeverouillageBloc>(
      create: (context)=>DeverouillageBloc(userLocalRepo:context.read<UserLocalRepo>(),appLocalRepo: context.read<AppLocalRepo>()),
      child: DeverouillageView(),
    );
  }
}

class DeverouillageView extends StatelessWidget {
  TextEditingController _controllerPwd=TextEditingController();

  DeverouillageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset(
                      'asset/logo.png',
                      width: 150,
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    controller: _controllerPwd,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Mot de passe',
                    ),
                  ),
                  Container(
                      height: 80,
                      alignment: Alignment.center,
                      child: BlocBuilder<DeverouillageBloc,SimpleLoadableState<String>>(
                        builder: (context,state){
                          if(state.state == EnumLoadableState.ERROR){
                            return Text(state.message!,style: TextStyle(color:Colors.red),);
                          }
                          else if(state.state == EnumLoadableState.LOADING){
                            return CircularProgressIndicator();
                          }
                          return Container();
                        },
                      )
                  ),
                  BlocListener<DeverouillageBloc,SimpleLoadableState<String>>(
                    listener: (context,state){
                      if(state.state == EnumLoadableState.DONE){
                        Navigator.pushReplacementNamed(context, MyHomePage.routeName);
                      }
                    },
                    child: ElevatedButton(
                      onPressed: (){
                        context.read<DeverouillageBloc>().connexion(_controllerPwd.text);
                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )
                          )
                      ),
                      child: Text(' Connexion '),
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('By NOPPAL',style: TextStyle(color: Colors.grey),),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top:40,right: 8.0),
                child: BlocListener<DeverouillageBloc,SimpleLoadableState<String>>(
                    listener: (context,state){
                      if(state.state == EnumLoadableState.DONE && state.message=='exit'){
                        Navigator.pushReplacementNamed(context, ConnexionPage.routeName);
                      }
                    },
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: IconButton(
                      onPressed: (){
                        context.read<DeverouillageBloc>().deconnexion();
                      },
                      icon: Icon(Icons.logout),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ) ;
  }
}

