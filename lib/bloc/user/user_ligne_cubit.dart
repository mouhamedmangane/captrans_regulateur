

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';
import 'package:noppal_util/repository/npl_treat_request_exception.dart';

import '../../app_const.dart';
import '../../repository/user/user_dis_repo.dart';

class UserLigneCubit extends Cubit<SimpleLoadableState<List<String>>>{
  UserDisRepo _userDisRepo;
  UserLigneCubit({required UserDisRepo userDisRepo}):
    _userDisRepo=userDisRepo,
     super(SimpleLoadableState.init())
  ;

  Future<void> load() async{
    emit(SimpleLoadableState.loading());
    _userDisRepo.getLignes().then((value){
      emit(SimpleLoadableState.done(value));
    }).catchError((error){
      String message;
      if(error is NplTreatRequestException) {
        message=error.message;
      } else if(error is TimeoutException) {
        message=AppConst.timeout;
      } else {
        message =  AppConst.noConnexion;
      }
      emit(SimpleLoadableState.error(message));
      throw error;

    });
  }

  Future<void> loadWithData(List<String> list) async{
    emit(SimpleLoadableState.done(list));
  }


}