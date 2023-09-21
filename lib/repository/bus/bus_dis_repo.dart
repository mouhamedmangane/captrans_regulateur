


import 'package:captrans_regulateur/model/bus.dart';
import 'package:captrans_regulateur/repository/bus/bus_repo.dart';
import 'package:noppal_util/converter/npl_converter_object.dart';
import 'package:noppal_util/dto/list_paginate.dart';
import 'package:noppal_util/repository/dis_repo.dart';
import 'package:noppal_util/repository/npl_treat_request.dart';

class BusDisRepo extends DisRepo implements BusRepo{

  NplTreatRequest treatRequest=new NplTreatRequest();
  NplConverterObject<Bus> converterBus=NplConverterObject((p0) => Bus.fromJson(p0));


  @override
  Future<ListPaginate<Bus>> findAll(String text,int page) {
    return getRequest('api/bus/search/${text}?page=${page}',
            (json) => treatRequest.makeListPaginationObject(json,converterBus)
    );
  }

  @override
  Future<Bus> findBusByMat(String matricule) {
    return getRequest('api/bus/etat/${matricule}',
            (json) => treatRequest.makeObject(json,converterBus)
    );
  }

  @override
  Future<Bus> findBusByMatRestrict(String matricule) {
    return getRequest('api/bus/etat-restrict/${matricule}',
            (json) => treatRequest.makeObject(json,converterBus)
    );
  }



}