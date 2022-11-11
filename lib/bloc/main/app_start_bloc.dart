

import 'package:bloc/bloc.dart';
import 'package:noppal_util/conf/env.dart';
import 'package:noppal_util/repository/dis_repo.dart';

class AppStartBloc extends Cubit<bool>{
  AppStartBloc(bool initialState) : super(initialState);
  load()async{
    //firebase,
    await MyConf.loadFilFromJson('conf/app.json');
    DisRepo.setGlobalConnexionByConf('server_1');
    await DisRepo.readGlobalToken();
    await Future.delayed(Duration(milliseconds: 500));
    emit(true);




  }
}
