


import 'package:bloc/bloc.dart';
import 'package:captrans_regulateur/model/bus.dart';
import 'package:captrans_regulateur/model/receveur.dart';
import 'package:captrans_regulateur/modelDataTest/receveur_data.dart';
import 'package:captrans_regulateur/repository/receveur/receveur_repo.dart';
import 'package:noppal_util/bloc/enum_loadable_state.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';
import 'package:noppal_util/repository/npl_treat_request_exception.dart';

class ReceveurRecentesBloc extends Cubit<SimpleLoadableState<List<Receveur>>>{
  ReceveurRepo receveurDisRepo;
  int cptTest=0;
  ReceveurRecentesBloc({required this.receveurDisRepo}):super(SimpleLoadableState.loading());

  Future<void> load(Bus bus) async {
    emit(SimpleLoadableState.loading());
    await receveurDisRepo.get4Recents(bus).then((value){
      emit(SimpleLoadableState.done(value));
    }).catchError((error){
      cptTest++;
      if(cptTest>1){
        emit(SimpleLoadableState.done(ReceveurData(3).getData()));
      }
      else if(error is NplTreatRequestException)
        emit(SimpleLoadableState.error(error.message));
      else
        emit(SimpleLoadableState.error("La requête n'a pas abouti, verifier votre connexion internet "));


    });
  }

}