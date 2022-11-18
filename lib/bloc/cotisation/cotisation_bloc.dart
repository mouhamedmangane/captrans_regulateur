

import 'package:bloc/bloc.dart';
import 'package:captrans_regulateur/model/cotisation.dart';
import 'package:captrans_regulateur/repository/cotisation/cotisation_repo.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';
import 'package:noppal_util/repository/npl_treat_request_exception.dart';

class CotisationBloc extends Cubit<SimpleLoadableState<Cotisation>>{
  CotisationRepo cotisationRepo;
  CotisationBloc({required CotisationRepo cotisationRepo}) :
        cotisationRepo=cotisationRepo,
        super(SimpleLoadableState.init());

  Future<void> init(Cotisation cotisation,bool mustCompleted) async{
    if(mustCompleted){
      reload(cotisation);
    }
    else{
      emit(SimpleLoadableState.done(cotisation));
    }
  }

  Future<void> reload(Cotisation cotisation) async{
    emit(SimpleLoadableState.loading());
    if(state.value!=null){
      cotisationRepo.getComplete(cotisation).then((value) {
        emit(SimpleLoadableState.done(value));
      }).catchError((error){
        String message;
        if(error is NplTreatRequestException){
          message=error.message;
        }
        else{
          message="La requete n'a pas abouti";
        }
        emit(SimpleLoadableState.error(message));
      });
    }
  }
}