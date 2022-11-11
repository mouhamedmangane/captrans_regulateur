
import 'package:bloc/bloc.dart';
import 'package:captrans_regulateur/model/bus.dart';
import 'package:captrans_regulateur/model/receveur.dart';
import 'package:captrans_regulateur/repository/receveur/receveur_dis_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:noppal_util/repository/npl_treat_request_exception.dart';

part 'receveur_search_event.dart';
part 'receveur_search_state.dart';

class ReceveurSearchBloc extends Bloc<ReceveurSearchEvent,ReceveurSearchState>{
  ReceveurDisRepo _receveurDisRepo;

  ReceveurSearchBloc({required ReceveurDisRepo receveurDisRepo}):
  _receveurDisRepo=receveurDisRepo,
  super(ReceveurSearchState()){
    on<ReceveurSearchLoad>(_onLoad);
  }
  
  Future<void> _onLoad(ReceveurSearchLoad event,Emitter<ReceveurSearchState> emit) async{
    state.status=ReceveurSearchStatus.loading;
    emit(state);
    await _receveurDisRepo.findAll(event.search,(state.page!)+1).then((value){
      state.status=ReceveurSearchStatus.done;
      state.page=state.page!+1;
      state.receveurs=value;
      emit(state);
    }).catchError((error){
      if(error is NplTreatRequestException) state.message=error.message;
      else state.message= error.toString();
      emit(state);
    });
  }
  

}