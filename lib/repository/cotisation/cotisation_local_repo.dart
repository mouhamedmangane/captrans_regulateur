
import 'package:captrans_regulateur/model/cotisation.dart';
import 'package:captrans_regulateur/model_dto/cotisation_et_total_dto.dart';
import 'package:captrans_regulateur/model_dto/cotisation_success.dart';
import 'package:captrans_regulateur/model_dto/cotisation_success_with_montant.dart';
import 'package:noppal_util/dto/list_paginate.dart';
import 'package:noppal_util/repository/local_repo_int_item.dart';
import 'package:noppal_util/repository/local_reposiroty.dart';

import '../../model_dto/cotisation_save.dart';
import 'cotisation_repo.dart';

class CotisationLocalRepo extends NplLocalReposiroty implements CotisationRepo{
  final LocalRepoIntItem _somme_total_item=LocalRepoIntItem("somme_total");

  CotisationLocalRepo() : super("cotisation");



  @override
  Future<CotisationEtTotalDto> en_cours(int regulateurId,int page,{String ? cotisationId}) {
    // TODO: implement en_cours
    throw UnimplementedError();
  }

  @override
  Future<int?> sommeTotal(int regulateurId) async {
    return get<int?>(_somme_total_item);
  }

  Future<void> setSommeTotal(int value)async{
    return set<int?>(_somme_total_item,value);
  }

  @override
  Future<Cotisation> getComplete(Cotisation cotisation) {
    // TODO: implement getComplete
    throw UnimplementedError();
  }

  @override
  Future<ListPaginate<Cotisation>> findByCollectId(int collectId,{int ? page}) {
    // TODO: implement findByCollectId
    throw UnimplementedError();
  }

  @override
  Future<ListPaginate<Cotisation>> findByBusId(int busId,{int? page}) {
    // TODO: implement findByBusId
    throw UnimplementedError();
  }

  @override
  Stream getCotisationEtTotalStream() {
    // TODO: implement getCotisationEtTotalStream
    throw UnimplementedError();
  }

  @override
  Future<CotisationSuccess> getDetail(int cotisationId) {
    // TODO: implement getDetail
    throw UnimplementedError();
  }

  @override
  Future<CotisationSuccessWithMoantant> add(CotisationSave cotisationSave) {
    // TODO: implement add
    throw UnimplementedError();
  }



}