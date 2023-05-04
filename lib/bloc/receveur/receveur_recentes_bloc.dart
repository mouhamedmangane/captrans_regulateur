


import 'package:bloc/bloc.dart';
import 'package:captrans_regulateur/model/bus.dart';
import 'package:captrans_regulateur/model/receveur.dart';
import 'package:captrans_regulateur/repository/receveur/receveur_repo.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';

class ReceveurRecentesBloc extends Cubit<SimpleLoadableState<List<Receveur>>>{
  ReceveurRepo receveurDisRepo;
  int cptTest=0;
  ReceveurRecentesBloc({required this.receveurDisRepo}):super(SimpleLoadableState.loading());

  Future<void> load(Bus bus) async {

    if(bus.receveurs!=null){
      emit(SimpleLoadableState.done(bus.receveurs!));
    }
    else
       emit(SimpleLoadableState.done([]));

  }

}