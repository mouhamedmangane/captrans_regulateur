
import 'package:bloc/bloc.dart';
import 'package:captrans_regulateur/app_const.dart';
import 'package:captrans_regulateur/model/cotisation.dart';
import 'package:captrans_regulateur/modelDataTest/cotisation_data.dart';
import 'package:noppal_util/bloc/enum_loadable_state.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';
import 'package:noppal_util/repository/npl_treat_request_exception.dart';

import '../../repository/cotisation/cotisation_repo.dart';

class CotisationEnCoursBloc extends Cubit<SimpleLoadableState<List<Cotisation>>>{
  CotisationRepo _cotisationRepo;
  int cptTest=0;
  CotisationEnCoursBloc(CotisationRepo cotisationRepo):
      _cotisationRepo=cotisationRepo,
       super(SimpleLoadableState.init());


  load() async{
    //emit(SimpleLoadableState.loading());
    //await Future.delayed(Duration(seconds: 1));
    return;
    await _cotisationRepo.en_cours().then((cotisations){
      emit(SimpleLoadableState.done(cotisations));
    }).catchError((error){
      cptTest++;
      if(cptTest>1){
        emit(SimpleLoadableState.done(CotisationData(10).getData()));
      }
      else {
        String message;
        if (error is NplTreatRequestException)
          message = error.message;
        else
          message = AppConst.no_connexion;
        emit(SimpleLoadableState.error(message));
      }
    });

  }

  Future<void> addNewCotisastion(Cotisation cotisation) async{
    emit(SimpleLoadableState(value: state.value,state: EnumLoadableState.LOADING));
    await Future.delayed(Duration(milliseconds: 500));
    if(state.value==null)
      state.value=[];
      state.value!.add(cotisation);
    emit(SimpleLoadableState.done(state.value!));
  }
}