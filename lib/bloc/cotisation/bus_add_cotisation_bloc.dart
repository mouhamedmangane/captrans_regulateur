

import 'package:bloc/bloc.dart';
import 'package:captrans_regulateur/model/bus.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';

class BusAddCotisationBloc extends Cubit<SimpleLoadableState<Bus>>{

  BusAddCotisationBloc(SimpleLoadableState<Bus> initialState) : super(initialState);

  init(){
    emit(SimpleLoadableState.init());
  }

  update(Bus bus){
    emit(SimpleLoadableState.done(bus));
  }

}