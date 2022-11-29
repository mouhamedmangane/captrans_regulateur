
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:captrans_regulateur/model/bus.dart';
import 'package:captrans_regulateur/modelDataTest/bus_data.dart';
import 'package:captrans_regulateur/repository/bus/bus_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:noppal_util/repository/npl_treat_request_exception.dart';

import '../../../app_const.dart';

part 'bus_search_event.dart';
part 'bus_search_state.dart';

class BusSearchBloc extends Bloc<BusSearchEvent,BusSearchState>{
  BusRepo _busDisRepo;
  int cptTest=0;
  int cptTest1=0;
  BusSearchBloc({required BusRepo busRepo}):
  _busDisRepo=busRepo,
  super(BusSearchState()){
    on<BusSearchLoad>(_onLoad,transformer: restartable());
    on<BusSearchOnAdded>(_onAdded,transformer: restartable());
  }

  Future<void> _onLoad(BusSearchLoad event,Emitter<BusSearchState> emit) async{
    if(event.search.isEmpty){
      emit(state.copyWith(status:BusSearchStatus.init,search: event.search,maxPage: 0,page:0));
      return ;
    }
    emit(state.copyWith(status: BusSearchStatus.loading,search: event.search,maxPage: 0,page: 0));
    await _busDisRepo.findAll(event.search,1).then((value){
      emit(state.copyWith(status:BusSearchStatus.done,buss: value.value,page: state.page+1,maxPage: value.maxPage));
      print('ok');
    }).catchError((error){
      cptTest++;
      if(cptTest>1){
        emit(state.copyWith(status:BusSearchStatus.done,buss: BusData(15).getData(),page: state.page+1,maxPage: 3));
        cptTest=0;
        return;
      }


      String message;
      if(error is NplTreatRequestException) message=error.message;
      else message =  AppConst.no_connexion;
      emit(state.copyWith(status:BusSearchStatus.error,page:0,message: message,buss: []));
      print('non');
    });
  }

  Future<void> _onAdded(BusSearchOnAdded event,Emitter<BusSearchState> emit)async {
    emit(state.copyWith(status: BusSearchStatus.loadingAdd));
    await _busDisRepo.findAll(state.search??'',state.page+1).then((value){
      state.buss.addAll(value.value);
      emit(state.copyWith(status:BusSearchStatus.done,page: state.page+1,maxPage: value.maxPage));
    }).catchError((error){
      cptTest1++;

      if(cptTest1>4){
        state.buss.addAll(BusData(5).getData());
        emit(state.copyWith(status:BusSearchStatus.errorAdd,page: state.page+1,message: 'test ttttt'));
        return;
      }
      else{
        state.buss.addAll(BusData(5).getData());
        emit(state.copyWith(status:BusSearchStatus.done,page: state.page+1,maxPage: 3));
        return;
      }
    });
  }



}