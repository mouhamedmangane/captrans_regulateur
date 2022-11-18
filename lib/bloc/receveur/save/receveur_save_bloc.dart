


import 'package:bloc/bloc.dart';
import 'package:captrans_regulateur/model/receveur.dart';
import 'package:equatable/equatable.dart';

part 'receveur_save_state.dart';
part 'receveur_save_event.dart';

class ReceveurSaveBloc extends Bloc<ReceveurSaveEvent,ReceveurSaveState>{
  ReceveurSaveBloc({required ReceveurSaveOperationType operationType})
      :super(ReceveurSaveState(operationType: operationType)){
    on<ReceveurSaveSubmit>(_onSubmit);
  }

  Future<void> _onSubmit(ReceveurSaveSubmit event,Emitter<ReceveurSaveState> emit) async {
    if(state.receveur == null){
      emit(state.copyWith(
          status:ReceveurSaveStatus.done,
          receveur: Receveur(id:0,nom: event.nom,tel: event.tel)
      ));
    }
    else {
      emit(state.copyWith(
          status: ReceveurSaveStatus.done,
          receveur: state.receveur!.copyWith(nom: event.nom,tel: event.tel)
      ));
    }
  }

}