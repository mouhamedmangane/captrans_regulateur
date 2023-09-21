

import 'package:captrans_regulateur/model/cotisation.dart';
import 'package:captrans_regulateur/model_dto/cotisation_global_info_jour_dto.dart';
import 'package:noppal_util/converter/npl_converter_object.dart';
import 'package:noppal_util/dto/list_paginate.dart';

class CotisationEtTotalParJourDto {
  List<CotisationGlobalInfoJour> liste;
  int montantEncaisser;

  CotisationEtTotalParJourDto({required this.liste,required this.montantEncaisser});

  CotisationEtTotalParJourDto.fromJson(Map<String,dynamic> json,NplConverterObject<CotisationGlobalInfoJour> converterObject):
        liste=json['cotisations'].map<CotisationGlobalInfoJour>((e) => CotisationGlobalInfoJour.fromJson(e)).toList(),
        montantEncaisser=json['montant_encaisser']??0
  ;

  Map<String,dynamic> toJson(){
    return {
      'cotisations':liste,
      'montant_encaisser':montantEncaisser,
    };
  }
}