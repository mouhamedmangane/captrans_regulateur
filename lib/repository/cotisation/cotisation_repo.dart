

import 'package:captrans_regulateur/model/cotisation.dart';
import 'package:captrans_regulateur/model_dto/cotisation_et_total_dto.dart';
import 'package:captrans_regulateur/model_dto/cotisation_save.dart';
import 'package:captrans_regulateur/model_dto/cotisation_success.dart';
import 'package:noppal_util/dto/list_paginate.dart';

import '../../model_dto/cotisation_success_with_montant.dart';

abstract class CotisationRepo{

  Future<int?> sommeTotal(int regulateurId);
  Future<CotisationSuccessWithMoantant> add(CotisationSave cotisationSave);
  Future<CotisationEtTotalDto> en_cours(int regulateurId,int page,
      {String ? cotisationId});
  Future<Cotisation> getComplete(Cotisation cotisation);
  Future<CotisationSuccess> getDetail(int cotisationId);
  Future<ListPaginate<Cotisation>> findByCollectId(int collectId,{int? page});
  Future<ListPaginate<Cotisation>> findByBusId(int busId,{int? page});
  Stream getCotisationEtTotalStream();

}