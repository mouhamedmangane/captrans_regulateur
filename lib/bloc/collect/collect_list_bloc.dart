
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:captrans_regulateur/model/collect.dart';
import 'package:captrans_regulateur/repository/collect/collect_repo.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';
import 'package:noppal_util/conf/env.dart';
import 'package:noppal_util/repository/npl_treat_request_exception.dart';

import '../../app_const.dart';

class CollectListBloc extends Cubit<SimpleLoadableState<List<Collect>>>{
  final CollectRepo _collectRepo;
  CollectListBloc({required CollectRepo collectRepo}):
    _collectRepo=collectRepo,
    super(SimpleLoadableState.init());

  void load() async{
    emit(SimpleLoadableState.loading());
    int id=MyConf.getNum(MyConfConstUser.ID_KEY).toInt();
    await _collectRepo.findLastCollects(id).then((value){
      emit(SimpleLoadableState.done(value));
      print('emiiiiiiiiiiiiiiiiit');
    }).catchError((error){
      String message;
      if(error is NplTreatRequestException) {
        message = error.message;
      } else if(error is TimeoutException) {
        message = AppConst.timeout;
      } else {
        message = AppConst.noConnexion;
      }
      emit(SimpleLoadableState.error(message));
      throw error;
    });
  }
}