import 'package:captrans_regulateur/bloc/user/connexion_bloc.dart';
import 'package:captrans_regulateur/model_dto/connexion_dto.dart';
import 'package:captrans_regulateur/my_app.dart';
import 'package:captrans_regulateur/repository/app_local_repo.dart';
import 'package:captrans_regulateur/repository/user/user_dis_repo.dart';
import 'package:captrans_regulateur/repository/user/user_local_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/bloc/enum_loadable_state.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';

class ConnexionPage extends StatelessWidget {

  static const String routeName="/connexion";

  ConnexionPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>ConnexionBloc(context.read<UserDisRepo>(),context.read<UserLocalRepo>(),context.read<AppLocalRepo>()),
        child: ConnexionView()
    );
  }
}

class ConnexionView extends StatelessWidget {
  TextEditingController _controllerLogin=TextEditingController();
  TextEditingController _controllerPwd=TextEditingController();
  ConnexionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset(
                      'asset/logo.png',
                      width: 150,
                    ),
                  ),
                  TextFormField(
                    controller: _controllerLogin,
                    decoration: InputDecoration(
                      hintText: 'Login',
                    ),
                  ),
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
                      child: BlocBuilder<ConnexionBloc,SimpleLoadableState<ConnexionDto>>(
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
                  BlocListener<ConnexionBloc,SimpleLoadableState<ConnexionDto>>(
                    listener: (context,state){
                      if(state.state == EnumLoadableState.DONE){
                        Navigator.pushReplacementNamed(context, MyHomePage.routeName);
                      }
                    },
                    child: ElevatedButton(
                      onPressed: (){
                        context.read<ConnexionBloc>().connexion(
                            ConnexionDto(
                                login: _controllerLogin.text,
                                password: _controllerPwd.text
                            )
                        );
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('By NOPPAL',style: TextStyle(color: Colors.grey),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

