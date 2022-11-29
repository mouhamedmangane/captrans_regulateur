

import 'package:bloc/bloc.dart';
import 'package:captrans_regulateur/model/cotisation.dart';
import 'package:captrans_regulateur/modelDataTest/cotisation_data.dart';
import 'package:captrans_regulateur/repository/cotisation/cotisation_repo.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';
import 'package:noppal_util/repository/npl_treat_request_exception.dart';

import '../../../app_const.dart';

class BusDetailCotisationBloc extends Cubit<SimpleLoadableState<List<Cotisation>>>{
  CotisationRepo _cotisationRepo;
  int cptTest=0;
  BusDetailCotisationBloc({required CotisationRepo cotisationRepo}):
  _cotisationRepo=cotisationRepo,
  super(SimpleLoadableState.init());

  Future<void> load(int busId) async{
    emit(SimpleLoadableState.loading());
    await _cotisationRepo.findByBusId(busId).then((value)  {
      emit(SimpleLoadableState.done(value));
    }).catchError((error){
      cptTest++;
      if(cptTest>1){
        emit(SimpleLoadableState.done(CotisationData(10).getData()));
      }
      else{
        String message="";
        if(error is NplTreatRequestException) message=error.message;
        else message =  AppConst.no_connexion;
        emit(SimpleLoadableState.error(message));
      }

    });

  }

}
