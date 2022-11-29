import 'package:bloc/bloc.dart';
import 'package:captrans_regulateur/repository/app_local_repo.dart';
import 'package:captrans_regulateur/repository/user/user_local_repo.dart';
import 'package:noppal_util/bloc/enum_loadable_state.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';
import 'package:noppal_util/conf/env.dart';
import 'package:noppal_util/repository/npl_treat_request_exception.dart';

import '../../app_const.dart';

class DeverouillageBloc extends Cubit<SimpleLoadableState<String>>{
  UserLocalRepo _userLocalRepo;
  AppLocalRepo _appLocalRepo;
  int cptTest=0;
  DeverouillageBloc({required UserLocalRepo userLocalRepo,required AppLocalRepo appLocalRepo}):
      _userLocalRepo=userLocalRepo,
      _appLocalRepo=appLocalRepo,
      super(SimpleLoadableState.init())
  ;

  Future<void> connexion(String code)async{
    emit(SimpleLoadableState(value: code, state: EnumLoadableState.LOADING));
    await _userLocalRepo.getUser().then((user){
      if(user.code == code){
        MyConf.addVariable(MyConfConstUser.USER_KEY,user);
        MyConf.addVariable(MyConfConstUser.ID_KEY,user.id);
        emit(SimpleLoadableState.done(code));
      }
      else{
        emit(SimpleLoadableState.error('Code invalide'));
      }

    }).catchError((error){
      // cptTest++;
      // if(cptTest>1){
      //   emit(SimpleLoadableState.done(code));
      //   return;
      // }
        String message;
        if(error is NplTreatRequestException) message=error.message;
        else message =  AppConst.no_connexion;
        emit(SimpleLoadableState.error(message));

    });
  }

  Future<void> deconnexion()async {
    await _appLocalRepo.deconnexion();
    emit(SimpleLoadableState.done('passer',message:'exit'));
  }
}