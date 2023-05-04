import 'dart:async';

import 'package:captrans_regulateur/model/cotisation.dart';
import 'package:captrans_regulateur/model_dto/cotisation_success.dart';
import 'package:captrans_regulateur/model_dto/cotisation_success_with_montant.dart';
import 'package:captrans_regulateur/repository/cotisation/cotisation_repo.dart';
import 'package:noppal_util/converter/npl_converter_object.dart';
import 'package:noppal_util/dto/list_paginate.dart';
import 'package:noppal_util/repository/dis_repo.dart';
import 'package:noppal_util/repository/npl_treat_request.dart';

import '../../model_dto/cotisation_et_total_dto.dart';
import '../../model_dto/cotisation_save.dart';

class CotisationDisRepo extends DisRepo implements CotisationRepo{

  StreamController _cotEtTotalStreamController = StreamController<CotisationEtTotalDto>.broadcast();
  NplTreatRequest treatRequest=new NplTreatRequest();
  late NplConverterObject<Cotisation> converterCotisation;
  late NplConverterObject<CotisationEtTotalDto> converterCotisationEtTotal;
  late NplConverterObject<CotisationSuccess> converterCotisationSuccess;
  late NplConverterObject<CotisationSuccessWithMoantant> converterCotisationWithTotal;

  CotisationDisRepo() : super(){
    converterCotisation=NplConverterObject((p0) => Cotisation.fromJson(p0));
    converterCotisationEtTotal=NplConverterObject((p0) => CotisationEtTotalDto.fromJson(p0,converterCotisation));
    converterCotisationSuccess = NplConverterObject((p0) => CotisationSuccess.fromJson(p0));
    converterCotisationWithTotal = NplConverterObject((p0) => CotisationSuccessWithMoantant.fromJson(p0));
  }

  @override
  Future<CotisationSuccessWithMoantant> add(CotisationSave cotisationSave) async{
    return postRequest<CotisationSuccessWithMoantant>(
        'api/cotisations/store',
        cotisationSave.toJson(),
        (json) => treatRequest.makeObject<CotisationSuccessWithMoantant>(json,converterCotisationWithTotal)
    );
  }

  @override
  Future<CotisationEtTotalDto> en_cours(int regulateurId,int page, {String ? cotisationId}) {
    return getRequest('api/cotisations/regulateur/${regulateurId}?page=${page}${(cotisationId!= null)?'&cotisation_id=${cotisationId}':''}',
        (json) {
            CotisationEtTotalDto cotisationEtTotalDto=treatRequest.makeObject(json,converterCotisationEtTotal);
            _cotEtTotalStreamController.add(cotisationEtTotalDto);
              return cotisationEtTotalDto;
        }
    );
  }

  @override
  Future<int?> sommeTotal(int regulateurId) {
    return getRequest('cotisations/regulateur/montant/${regulateurId}',
            (json) => treatRequest.make<int>(json)
    );
  }

  @override
  Future<Cotisation> getComplete(Cotisation cotisation) {
    return getRequest('api/cotisations/${cotisation.id}',
        (json) => treatRequest.makeObject<Cotisation>(json,converterCotisation)
    );
  }

  @override
  Future<ListPaginate<Cotisation>> findByCollectId(int collectId,{int ? page=1}) {
    return getRequest('api/cotisations/collecte/$collectId?page=$page',
            (json) => treatRequest.makeListPaginationObject(json,converterCotisation)
    );
  }

  @override
  Future<ListPaginate<Cotisation>> findByBusId(int busId, {int ? page=1}) {
    return getRequest('api/cotisations/bus/$busId?page=$page',
            (json) => treatRequest.makeListPaginationObject(json,converterCotisation)
    );
  }

  @override
  Stream getCotisationEtTotalStream() {
    return _cotEtTotalStreamController.stream;
  }

  @override
  Future<CotisationSuccess> getDetail(int cotisationId) {
    return getRequest('api/cotisations/${cotisationId}',
            (json) => treatRequest.makeObject<CotisationSuccess>(json,converterCotisationSuccess)
    );
  }


  

}