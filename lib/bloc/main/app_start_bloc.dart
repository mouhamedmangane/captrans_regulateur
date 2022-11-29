

import 'package:bloc/bloc.dart';
import 'package:captrans_regulateur/repository/app_local_repo.dart';
import 'package:noppal_util/conf/env.dart';
import 'package:noppal_util/repository/dis_repo.dart';

class AppStartBloc extends Cubit<int>{
  AppStartBloc(int initialState) : super(initialState);
  load()async{
    //firebase,
    AppLocalRepo appLocalRepo=AppLocalRepo();
    await MyConf.loadFilFromJson('conf/app.json');
    DisRepo.setGlobalConnexionByConf('server_1');
    await DisRepo.readGlobalToken();
    await Future.delayed(Duration(milliseconds: 500));
    if(await appLocalRepo.has_connected())
      emit(2);
    else
      emit(1);
  }
}
