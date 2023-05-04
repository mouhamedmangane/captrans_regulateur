

import 'package:captrans_regulateur/model/cotisation.dart';
import 'package:noppal_util/converter/npl_converter_object.dart';
import 'package:noppal_util/dto/list_paginate.dart';

class CotisationEtTotalDto {
  ListPaginate<Cotisation> cotisations;
  int montantEncaisser;

  CotisationEtTotalDto({required this.cotisations,required this.montantEncaisser});

  CotisationEtTotalDto.fromJson(Map<String,dynamic> json,NplConverterObject<Cotisation> converterObject):
      cotisations=ListPaginate.fromJson(json['cotisations'], converterObject),
      montantEncaisser=json['montant_encaisser']??0
  ;

  Map<String,dynamic> toJson(){
    return {
      'cotisations':cotisations,
      'montant_encaisser':montantEncaisser,
    };
  }
}