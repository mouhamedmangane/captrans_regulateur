import 'package:bloc/bloc.dart';
import 'package:captrans_regulateur/repository/cotisation/cotisation_local_repo.dart';
import 'package:captrans_regulateur/repository/cotisation/cotisation_repo.dart';
import 'package:noppal_util/bloc/enum_loadable_state.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TotalCotisationBloc extends Cubit<SimpleLoadableState<int>>{
  final CotisationRepo cotisationRepo = CotisationLocalRepo();
  TotalCotisationBloc(SimpleLoadableState<int> initialState) : super(initialState);

  void  load()async {
    emit(SimpleLoadableState.loading());
    int somme= (await cotisationRepo.sommeTotal()) ?? 82500;
    emit(SimpleLoadableState.done(somme));

  }

}