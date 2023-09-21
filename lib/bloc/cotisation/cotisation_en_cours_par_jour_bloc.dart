
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:captrans_regulateur/app_const.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';

import 'package:noppal_util/bloc/simple_loadable_state_paginate.dart';
import 'package:noppal_util/conf/env.dart';
import 'package:noppal_util/repository/npl_treat_request_exception.dart';


import '../../model/cotisation.dart';
import '../../model_dto/cotisation_global_info_jour_dto.dart';
import '../../repository/cotisation/cotisation_repo.dart';

class CotisationEnCoursParJourBloc extends Cubit<SimpleLoadableState<List<CotisationGlobalInfoJour>>>{
  final CotisationRepo _cotisationRepo;
  int cptTest=0;
  CotisationEnCoursParJourBloc(CotisationRepo cotisationRepo):
        _cotisationRepo=cotisationRepo,
        super(SimpleLoadableState.init());

  load() async{
    emit(SimpleLoadableState.loading());
      int id=MyConf.getNum(MyConfConstUser.ID_KEY).toInt();
      await _cotisationRepo.en_cours_jours(id).then((dto){
        emit(SimpleLoadableState.done(dto.liste));
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

}
