

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:captrans_regulateur/app_const.dart';
import 'package:captrans_regulateur/model/bus.dart';
import 'package:captrans_regulateur/model/receveur.dart';
import 'package:captrans_regulateur/model_dto/cotisation_save.dart';
import 'package:captrans_regulateur/model_dto/cotisation_success_with_montant.dart';
import 'package:captrans_regulateur/repository/cotisation/cotisation_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:noppal_util/conf/env.dart';
import 'package:noppal_util/repository/npl_treat_request_exception.dart';


part 'add_cotisation_state.dart';
part 'add_cotisation_event.dart';

class AddCotisationBloc extends Bloc<AddCotisationEvent,AddCotisationState>{
  int aa=0;
  final CotisationRepo _cotisationRepo;

  AddCotisationBloc(CotisationRepo cotisationRepo)
      : _cotisationRepo=cotisationRepo,
        super(const AddCotisationState()){
    on<AddCotisationSelectedReceveur>(_onSelectedReceveur,transformer: restartable());
    on<AddCotisationSelectedBus>(_onSelectedBus,transformer: restartable());
    on<AddCotisationValidation>(_onValidation,transformer: droppable());
  }

  Future<void> _onSelectedBus(AddCotisationSelectedBus event,Emitter<AddCotisationState> emit) async{
    emit(state.copyWith(bus: event.bus));
  }
  Future<void> _onSelectedReceveur(AddCotisationSelectedReceveur event,Emitter<AddCotisationState> emit) async{
    emit(state.copyWith(receveur: event.receveur));
  }

  Future<void> _onValidation(AddCotisationValidation event,Emitter<AddCotisationState> emit) async{
    emit(state.copyWith(status: AddCotisationStatus.loading,montant: event.montant));
    //await Future.delayed(const Duration(milliseconds: 3000));

    await _cotisationRepo.add(CotisationSave(
        montant: state.montant!,
        userId: MyConf.getNum(MyConfConstUser.ID_KEY).toInt(),
        receveurId: state.receveur!.id,
        receveurNom:state.receveur!.nom,
        receveurTel:state.receveur!.tel,
        busId: state.bus!.id)
    ).then((CotisationSuccessWithMoantant cotisation) {
      emit(state.copyWith(status:AddCotisationStatus.success,cotisation:cotisation));
    }).catchError((error){
      String message;
      if(error is NplTreatRequestException) {
        message = error.message;
      } else if(error is TimeoutException) {
        message = AppConst.timeout;
      } else {
        message = AppConst.noConnexion;
      }
      emit(state.copyWith(status:AddCotisationStatus.failure,message:message));
      throw(error);
    });
  }


}