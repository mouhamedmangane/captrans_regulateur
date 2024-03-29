


import 'package:captrans_regulateur/model/bus.dart';
import 'package:captrans_regulateur/model/receveur.dart';
import 'package:captrans_regulateur/repository/receveur/receveur_repo.dart';
import 'package:noppal_util/converter/npl_converter_object.dart';
import 'package:noppal_util/dto/list_paginate.dart';
import 'package:noppal_util/repository/dis_repo.dart';
import 'package:noppal_util/repository/npl_treat_request.dart';

class ReceveurDisRepo extends DisRepo implements ReceveurRepo{

  NplTreatRequest treatRequest=new NplTreatRequest();
  NplConverterObject<Receveur> converter=NplConverterObject((p0) => Receveur.fromJson(p0));

  @override
  Future<ListPaginate<Receveur>> findAll(String text,int page) {
    return getRequest('api/receveurs/search/${text}?page=${page}',
            (json) => treatRequest.makeListPaginationObject(json,converter)
    );
  }

  @override
  Future<List<Receveur>> get4Recents(Bus bus) {
    return getRequest('receveur/recentes',
            (json) => treatRequest.makeListObject(json,converter)
    );
  }

  @override
  Future<Receveur> save(Receveur receveur) {
    return postRequest('receveur',
            receveur.toJson(),
            (json) => treatRequest.make(json)
    );
  }
  
}