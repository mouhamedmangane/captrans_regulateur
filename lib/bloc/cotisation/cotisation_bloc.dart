

import 'package:bloc/bloc.dart';
import 'package:captrans_regulateur/model/cotisation.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';

class CotisationBloc extends Cubit<SimpleLoadableState<Cotisation>>{
  CotisationBloc(SimpleLoadableState<Cotisation> initialState) : super(initialState);

}