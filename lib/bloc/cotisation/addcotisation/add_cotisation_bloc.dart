

import 'package:bloc/bloc.dart';
import 'package:captrans_regulateur/model/bus.dart';
import 'package:captrans_regulateur/model/cotisation.dart';
import 'package:captrans_regulateur/model/receveur.dart';
import 'package:captrans_regulateur/modelDataTest/cotisation_data.dart';
import 'package:captrans_regulateur/model_dto/cotisation_save.dart';
import 'package:captrans_regulateur/repository/cotisation/cotisation_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:noppal_util/conf/env.dart';
import 'package:noppal_util/conf/user_const_conf.dart';


part 'add_cotisation_state.dart';
part 'add_cotisation_event.dart';

class AddCotisationBloc extends Bloc<AddCotisationEvent,AddCotisationState>{
  int aa=0;
  CotisationRepo _cotisationRepo;

  AddCotisationBloc(CotisationRepo cotisationRepo)
      : _cotisationRepo=cotisationRepo,
        super(AddCotisationState()){
    on<AddCotisationSelectedReceveur>(_onSelectedReceveur);
    on<AddCotisationSelectedBus>(_onSelectedBus);
    on<AddCotisationValidation>(_onValidation);
  }

  Future<void> _onSelectedBus(AddCotisationSelectedBus event,Emitter<AddCotisationState> emit) async{
    emit(state.copyWith(bus: event.bus));
  }
  Future<void> _onSelectedReceveur(AddCotisationSelectedReceveur event,Emitter<AddCotisationState> emit) async{
    emit(state.copyWith(receveur: event.receveur));
  }

  Future<void> _onValidation(AddCotisationValidation event,Emitter<AddCotisationState> emit) async{
    emit(state.copyWith(status: AddCotisationStatus.loading,montant: event.montant));
    _cotisationRepo.add(CotisationSave(
        montant: state.montant!,
        regulateurId: MyConf.getNum(UserConstConf.ID_KEY).toInt(),
        receveurId: state.receveur!.id,
        busId: state.bus!.id)
    ).then((Cotisation cotisation) {
      emit(state.copyWith(status:AddCotisationStatus.success,cotisation:cotisation));
    }).catchError((error){
      aa++;
      if(aa>2)
        emit(state.copyWith(status:AddCotisationStatus.success,cotisation:CotisationData(2).next()));
      emit(state.copyWith(status:AddCotisationStatus.failure,message: error.toString()));
    });
  }


}