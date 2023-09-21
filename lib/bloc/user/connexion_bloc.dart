

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:captrans_regulateur/model_dto/connexion_dto.dart';
import 'package:captrans_regulateur/repository/app_local_repo.dart';
import 'package:captrans_regulateur/repository/user/user_dis_repo.dart';
import 'package:captrans_regulateur/repository/user/user_local_repo.dart';
import 'package:noppal_util/bloc/enum_loadable_state.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';
import 'package:noppal_util/conf/env.dart';
import 'package:noppal_util/repository/dis_repo.dart';
import 'package:noppal_util/repository/npl_treat_request_exception.dart';

import '../../app_const.dart';

class ConnexionBloc extends Cubit<SimpleLoadableState<ConnexionDto>>{
  UserDisRepo _userDisRepo;
  UserLocalRepo _userLocalRepo;
  AppLocalRepo _appLocalRepo;
  int cptTest=0;

  ConnexionBloc(UserDisRepo userDisRepo,UserLocalRepo userLocalRepo,AppLocalRepo appLocalRepo):
  _userDisRepo=userDisRepo,
  _userLocalRepo=userLocalRepo,
  _appLocalRepo=appLocalRepo,
  super(SimpleLoadableState.init());
  
  Future<void> connexion(ConnexionDto connexionDto) async {
    emit(SimpleLoadableState(value: connexionDto, state: EnumLoadableState.LOADING));
    await _userDisRepo.connexionRegulateur(connexionDto).then((user){
      print(user);
      assert(user.token != null,'Probleme d\'authentification. Consulter le service d\'administration');
      assert(user.token!.isNotEmpty,'Probleme d\'authentification. Consulter le service d\'administration');
      user=user.copyWith(code: connexionDto.password);
      _userLocalRepo.save(user);

      MyConf.addVariable(MyConfConstUser.USER_KEY,user);
      MyConf.addVariable(MyConfConstUser.ID_KEY,user.id);
      _appLocalRepo.save_token(user.token!);
      _appLocalRepo.save_connected();
      DisRepo.setGlobalToken(user.token);
      emit(SimpleLoadableState.done(connexionDto));
    }).catchError((error){

        String message='';
        if(error is NplTreatRequestException) message=error.message;
        else if(error is TimeoutException) message=AppConst.timeout;
        else message =  AppConst.noConnexion;
        emit(SimpleLoadableState.error(message));
        throw error;

    });
  }
  
}