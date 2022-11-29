

import 'package:bloc/bloc.dart';
import 'package:captrans_regulateur/modelDataTest/user_data.dart';
import 'package:captrans_regulateur/model_dto/connexion_dto.dart';
import 'package:captrans_regulateur/repository/app_local_repo.dart';
import 'package:captrans_regulateur/repository/user/user_dis_repo.dart';
import 'package:captrans_regulateur/repository/user/user_local_repo.dart';
import 'package:noppal_util/bloc/enum_loadable_state.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';
import 'package:noppal_util/conf/env.dart';
import 'package:noppal_util/repository/npl_treat_request_exception.dart';

import '../../app_const.dart';
import '../../model/user.dart';

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
      _userLocalRepo.save(user);
      user=user.copyWith(code: connexionDto.password);
      MyConf.addVariable(MyConfConstUser.USER_KEY,user);
      MyConf.addVariable(MyConfConstUser.ID_KEY,user.id);
      _appLocalRepo.save_connected();
      emit(SimpleLoadableState.done(connexionDto));
    }).catchError((error){
      cptTest ++;
      if(cptTest>1){
        User user =UserData(2).next();
        user=user.copyWith(code: connexionDto.password);

        MyConf.addVariable(MyConfConstUser.USER_KEY,user);
        MyConf.addVariable(MyConfConstUser.ID_KEY,user.id);
        _appLocalRepo.save_connected();
        _userLocalRepo.save(user);
        emit(SimpleLoadableState.done(connexionDto));
      }
      else{
        String message='';
        if(error is NplTreatRequestException) message=error.message;
        else message =  AppConst.no_connexion;
        emit(SimpleLoadableState.error(message));
      }
    });
  }
  
}