

import 'package:bloc/bloc.dart';
import 'package:captrans_regulateur/app_const.dart';
import 'package:captrans_regulateur/model/bus.dart';
import 'package:captrans_regulateur/model/cotisation.dart';
import 'package:captrans_regulateur/model/receveur.dart';
import 'package:captrans_regulateur/modelDataTest/cotisation_data.dart';
import 'package:captrans_regulateur/model_dto/cotisation_save.dart';
import 'package:captrans_regulateur/repository/cotisation/cotisation_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';


part 'add_cotisation_state.dart';
part 'add_cotisation_event.dart';

class AddCotisationBloc extends Bloc<AddCotisationEvent,AddCotisationState>{
  int aa=0;
  CotisationRepo _cotisationRepo;

  AddCotisationBloc(CotisationRepo cotisationRepo)
      : _cotisationRepo=cotisationRepo,
        super(AddCotisationState()){
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
    await Future.delayed(Duration(milliseconds: 3000));

    await _cotisationRepo.add(CotisationSave(
        montant: state.montant!,
        regulateurId: 1,
        //regulateurId: MyConf.getNum(UserConstConf.ID_KEY).toInt(),
        receveurId: state.receveur!.id,
        busId: state.bus!.id)
    ).then((Cotisation cotisation) {
      emit(state.copyWith(status:AddCotisationStatus.success,cotisation:cotisation));
    }).catchError((error){
      print('cotisation catch');
      aa++;
      if(aa>1){
        Cotisation cotisationL=CotisationData(2).next();
        Cotisation cotisation=cotisationL.copyWith(
          receveur: state.receveur,
          montant: event.montant,
          montantCotiser: event.montant,
        );

        emit(state.copyWith(status:AddCotisationStatus.success,cotisation:cotisation));
      }
      emit(state.copyWith(status:AddCotisationStatus.failure,message:AppConst.no_connexion));
    });
  }


}