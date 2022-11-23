


import 'package:captrans_regulateur/model/bus.dart';
import 'package:captrans_regulateur/repository/bus/bus_repo.dart';
import 'package:noppal_util/dto/list_paginate.dart';
import 'package:noppal_util/repository/dis_repo.dart';
import 'package:noppal_util/repository/npl_treat_request.dart';

class BusDisRepo extends DisRepo implements BusRepo{

  NplTreatRequest treatRequest=new NplTreatRequest();

  @override
  Future<ListPaginate<Bus>> findAll(String text,int page) {
    return getRequest('bus/all/${text}',
            (json) => treatRequest.makeListPagination(json)
    );
  }

  @override
  Future<Bus> findBusByMat(String matricule) {
    return getRequest('bus/matricule/${matricule}',
            (json) => treatRequest.make(json)
    );
  }



}