import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:captrans_regulateur/repository/cotisation/cotisation_repo.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';

import '../../model/cotisation.dart';
import '../../model_dto/cotisation_et_total_dto.dart';

class TotalCotisationBloc extends Cubit<SimpleLoadableState<int>>{
  final CotisationRepo cotisationRepo;
  late final StreamSubscription _subscription;

  TotalCotisationBloc(this.cotisationRepo) : super(SimpleLoadableState.init()){
    _subscription=cotisationRepo.getCotisationEtTotalStream().listen((event) {
      CotisationEtTotalDto dto= event as CotisationEtTotalDto;
      emit(SimpleLoadableState.done(dto.montantEncaisser));
    });
  }

  void  load()async {
    return;

  }
  Future<void> changeMontant(int montant)async{
    emit(SimpleLoadableState.done(montant));
  }

  Future<void>  reloadload(List<Cotisation> cotisations)async {
    emit(SimpleLoadableState.loading());
    //int somme= (await cotisationRepo.sommeTotal()) ?? 82500;
    int somme=0;
    for (Cotisation element in cotisations) {
      somme+=element.montant;
    }
    emit(SimpleLoadableState.done(somme));

  }

  @override
  Future<void> close() {
    _subscription.cancel();
    // TODO: implement close
    return super.close();
  }

}