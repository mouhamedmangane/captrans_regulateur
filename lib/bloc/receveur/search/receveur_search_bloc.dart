
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:captrans_regulateur/app_const.dart';
import 'package:captrans_regulateur/model/receveur.dart';
import 'package:captrans_regulateur/modelDataTest/receveur_data.dart';
import 'package:captrans_regulateur/repository/receveur/receveur_dis_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:noppal_util/repository/npl_treat_request_exception.dart';

part 'receveur_search_event.dart';
part 'receveur_search_state.dart';

class ReceveurSearchBloc extends Bloc<ReceveurSearchEvent,ReceveurSearchState>{
  ReceveurDisRepo _receveurDisRepo;
  int cptTest=0;
  int cptTest1=0;
  ReceveurSearchBloc({required ReceveurDisRepo receveurDisRepo}):
  _receveurDisRepo=receveurDisRepo,
  super(ReceveurSearchState()){
    on<ReceveurSearchLoad>(_onLoad,transformer: restartable());
    on<ReceveurSearchOnAdded>(_onAdded,transformer: restartable());
  }

  Future<void> _onLoad(ReceveurSearchLoad event,Emitter<ReceveurSearchState> emit) async{
    emit(state.copyWith(status: ReceveurSearchStatus.loading,search: event.search,maxPage: 0,page: 0));
    if(event.search.isNotEmpty){
      await _receveurDisRepo.findAll(event.search,state.page).then((value){
        emit(state.copyWith(status:ReceveurSearchStatus.done,receveurs: value.data,page: state.page+1,maxPage: value.lastPage));
        print('ok');
      }).catchError((error){
        String message;
        if(error is NplTreatRequestException) message=error.message;
        else if(error is TimeoutException) message=AppConst.timeout;
        else message =  AppConst.noConnexion;
        emit(state.copyWith(status:ReceveurSearchStatus.error,page:0,message: message,receveurs: []));
        print('non');
        throw error;
      });
    }
    else{
      emit(state.copyWith(status: ReceveurSearchStatus.init));
    }

  }

  Future<void> _onAdded(ReceveurSearchOnAdded event,Emitter<ReceveurSearchState> emit)async {
    emit(state.copyWith(status: ReceveurSearchStatus.loadingAdd));
    await _receveurDisRepo.findAll(state.search??'',state.page+1).then((value){
      state.receveurs.addAll(value.data);
      emit(state.copyWith(status:ReceveurSearchStatus.done,page: state.page+1,maxPage: value.lastPage));
    }).catchError((error){
      cptTest1++;

      if(cptTest1>1){
        state.receveurs.addAll(ReceveurData(10).getData());
        emit(state.copyWith(status:ReceveurSearchStatus.done,page: state.page+1,maxPage: 3));
        return;
      }
      state.receveurs.addAll(ReceveurData(10).getData());
      emit(state.copyWith(status:ReceveurSearchStatus.errorAdd,page: state.page+1,message:AppConst.noConnexion));
      return;
    });
  }



}