
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:captrans_regulateur/model/bus.dart';
import 'package:captrans_regulateur/repository/bus/bus_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:noppal_util/dto/list_paginate.dart';
import 'package:noppal_util/repository/npl_treat_request_exception.dart';

import '../../../app_const.dart';

part 'bus_search_event.dart';
part 'bus_search_state.dart';

class BusSearchBloc extends Bloc<BusSearchEvent,BusSearchState>{
  final BusRepo _busDisRepo;
  int cptTest=0;
  int cptTest1=0;
  BusSearchBloc({required BusRepo busRepo}):
  _busDisRepo=busRepo,
  super(BusSearchState()){
    on<BusSearchLoad>(_onLoad,transformer: restartable());
   on<BusSearchOnAdded>(_onAdd,transformer: restartable());
  }

  Future<void> _onLoad(BusSearchLoad event,Emitter<BusSearchState> emit) async{
    if(event.search.isEmpty){
      emit(state.copyWith(status:BusSearchStatus.init,search: event.search,buss: ListPaginate()));
      return ;
    }
    emit(state.copyWith(status: BusSearchStatus.loading,search: event.search));
    await _busDisRepo.findAll(event.search,1).then((value){
      emit(state.copyWith(status:BusSearchStatus.done,buss: value));
    }).catchError((error){
      String message;
      if(error is NplTreatRequestException) {
        message = error.message;
      } else {
        message = AppConst.noConnexion;
      }
      emit(state.copyWith(status:BusSearchStatus.error,message: message));

    });
  }

  Future<void> _onAdd(BusSearchOnAdded event,Emitter<BusSearchState> emit) async{
    if(!state.buss.isLimit()){
      emit(state.copyWith(status: BusSearchStatus.loadingAdd));
      await _busDisRepo.findAll(state.search??'',state.buss.currentPage+1).then((value){
        state.buss.addPage(value);
        emit(state.copyWith(status:BusSearchStatus.done));
      }).catchError((error){
        String message;
        if(error is NplTreatRequestException) {
          message = error.message;
        } else {
          message = AppConst.noConnexion;
        }
        emit(state.copyWith(status:BusSearchStatus.errorAdd,message: message));
      });
    }
  }





}