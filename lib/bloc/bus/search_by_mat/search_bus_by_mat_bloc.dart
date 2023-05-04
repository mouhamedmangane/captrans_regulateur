


import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:captrans_regulateur/model/bus.dart';
import 'package:captrans_regulateur/repository/bus/bus_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:noppal_util/repository/npl_treat_request_exception.dart';

import '../../../app_const.dart';

part 'search_bus_by_mat_event.dart';

part 'search_bus_by_mat_state.dart';

class SearchBusByMatBloc extends Bloc<SearchBusByMatEvent,SearchBusByMatState>{
  int cpt=0;
  final BusRepo _busRepoy;
  SearchBusByMatBloc({required BusRepo busRepo}) :
        _busRepoy=busRepo,
        super(const SearchBusByMatState()){
    on<SearchBusByMatCharger>(_onCharger);
    on<SearchBusByMatFailled>(_onFaillure);
  }
  Future<void> _onCharger(SearchBusByMatCharger event,Emitter<SearchBusByMatState> emit)async {
    emit(state.copyWith(matricule: event.matricule,status:SearchBusByMatStatus.loading));
    await _busRepoy.findBusByMat(event.matricule.replaceAll(' ', '')).then((value){
      emit(state.copyWith( status: SearchBusByMatStatus.success,bus: value));
    }).catchError((error){
      String message;
      if(error is NplTreatRequestException) {
        message = error.message;
      } else if(error is TimeoutException) {
        message = AppConst.timeout;
      } else {
        message = AppConst.noConnexion;
      }
      add(SearchBusByMatFailled(message));
    });
  }

  Future<void> _onFaillure(SearchBusByMatFailled event,Emitter<SearchBusByMatState> emit) async{
    if(event.hasConnexion){
      emit(state.copyWith(status:SearchBusByMatStatus.failureTreatement,message:event.message));
    }
    else{
      emit(state.copyWith(status:SearchBusByMatStatus.failureRequest,message:event.message));

    }
  }
}