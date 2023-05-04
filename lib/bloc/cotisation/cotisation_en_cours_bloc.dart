
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:captrans_regulateur/app_const.dart';

import 'package:noppal_util/bloc/simple_loadable_state_paginate.dart';
import 'package:noppal_util/conf/env.dart';
import 'package:noppal_util/repository/npl_treat_request_exception.dart';


import '../../model/cotisation.dart';
import '../../repository/cotisation/cotisation_repo.dart';

class CotisationEnCoursBloc extends Cubit<SimpleLoadableStatePaginate<Cotisation>>{
  final CotisationRepo _cotisationRepo;
  int cptTest=0;
  CotisationEnCoursBloc(CotisationRepo cotisationRepo):
      _cotisationRepo=cotisationRepo,
       super(SimpleLoadableStatePaginate());

 Future<void> reinit() async{
  state.clear();
  await load();
 }

  load() async{
    if(!state.isLimit()){
      if(state.value.currentPage>0) {
        emit(state.loadingAdd());
      } else {
        emit(state.loading());
      }
      int id=MyConf.getNum(MyConfConstUser.ID_KEY).toInt();
      await _cotisationRepo.en_cours(id,state.value.currentPage+1,cotisationId: state.param).then((dto){
        if(dto.cotisations.currentPage==1 && dto.cotisations.data.isNotEmpty) {
          emit(state.done(dto.cotisations,param: dto.cotisations.data.first.id.toString()));
        } else {
          emit(state.done(dto.cotisations));
        }
      }).catchError((error){
        String message;
        if(error is NplTreatRequestException) {
          message=error.message;
        } else if(error is TimeoutException) {
          message=AppConst.timeout;
        } else {
          message =  AppConst.noConnexion;
        }

        if(state.value.currentPage>0) {
          emit(state.errorAdd(message));
        } else {
          emit(state.error(message));
        }
         throw error;
      });
    }

  }



  addNewCotisastion(Cotisation cotisation) async {
    emit(state.insertInFirst(cotisation));
  }
}
