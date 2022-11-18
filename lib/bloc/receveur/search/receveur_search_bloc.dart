
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
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
    await _receveurDisRepo.findAll(event.search,1).then((value){
      emit(state.copyWith(status:ReceveurSearchStatus.done,receveurs: value.value,page: state.page+1,maxPage: value.maxPage));
      print('ok');
    }).catchError((error){
      cptTest++;
      if(cptTest>2){
        emit(state.copyWith(status:ReceveurSearchStatus.done,receveurs: ReceveurData(15).getData(),page: state.page+1,maxPage: 3));
        cptTest=0;
        return;
      }
      else if(cptTest>1){
        emit(state.copyWith(status:ReceveurSearchStatus.done,receveurs: [],page: state.page+1,maxPage: 3));
        return;
      }

      String message;
      if(error is NplTreatRequestException) message=error.message;
      else message= error.toString();
      emit(state.copyWith(status:ReceveurSearchStatus.error,page:0,message: message,receveurs: []));
      print('non');
    });
  }

  Future<void> _onAdded(ReceveurSearchOnAdded event,Emitter<ReceveurSearchState> emit)async {
    emit(state.copyWith(status: ReceveurSearchStatus.loadingAdd));
    await _receveurDisRepo.findAll(state.search??'',state.page+1).then((value){
      state.receveurs.addAll(value.value);
      emit(state.copyWith(status:ReceveurSearchStatus.done,page: state.page+1,maxPage: value.maxPage));
    }).catchError((error){
      cptTest1++;

      if(cptTest1>4){
        state.receveurs.addAll(ReceveurData(5).getData());
        emit(state.copyWith(status:ReceveurSearchStatus.errorAdd,page: state.page+1,message: 'test ttttt'));
        return;
      }
      else{
        state.receveurs.addAll(ReceveurData(5).getData());
        emit(state.copyWith(status:ReceveurSearchStatus.done,page: state.page+1,maxPage: 3));
        return;
      }
      String message;
      if(error is NplTreatRequestException) message=error.message;
      else message= error.toString();
      emit(state.copyWith(status:ReceveurSearchStatus.errorAdd,message: message,));
    });
  }



}