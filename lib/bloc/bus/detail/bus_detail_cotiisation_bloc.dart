

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:captrans_regulateur/model/cotisation.dart';
import 'package:captrans_regulateur/repository/cotisation/cotisation_repo.dart';
import 'package:noppal_util/bloc/simple_loadable_state_paginate.dart';
import 'package:noppal_util/repository/npl_treat_request_exception.dart';

import '../../../app_const.dart';

class BusDetailCotisationBloc extends Cubit<SimpleLoadableStatePaginate<Cotisation>>{
  final CotisationRepo _cotisationRepo;
  BusDetailCotisationBloc(CotisationRepo cotisationRepo):
        _cotisationRepo=cotisationRepo,
        super(SimpleLoadableStatePaginate());

  Future<void> reinit(busId) async{
    state.clear();
    load(busId);
  }

  Future<void> load(busId) async{
    if(!state.isLimit()){
      if(state.value.currentPage>0) {
        emit(state.loadingAdd());
      } else {
        emit(state.loading());
      }
      await _cotisationRepo.findByBusId(busId,page:state.value.currentPage+1,).then((cotisations){
          print('----------------------');
          print(cotisations.total);
          print(cotisations.data);
          emit(state.done(cotisations));

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


}
