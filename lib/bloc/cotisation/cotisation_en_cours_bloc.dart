
import 'package:bloc/bloc.dart';
import 'package:captrans_regulateur/model/cotisation.dart';
import 'package:captrans_regulateur/modelDataTest/cotisation_data.dart';
import 'package:noppal_util/bloc/enum_loadable_state.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';

class CotisationEnCoursBloc extends Cubit<SimpleLoadableState<List<Cotisation>>>{
  CotisationEnCoursBloc(SimpleLoadableState<List<Cotisation>> initialState) : super(initialState);


  load(){
    emit(SimpleLoadableState(value: CotisationData(10).getData(), state: EnumLoadableState.DONE));
  }
}