


import 'package:captrans_regulateur/model/bus.dart';
import 'package:captrans_regulateur/model/receveur.dart';
import 'package:noppal_util/dto/list_paginate.dart';

abstract class ReceveurRepo {

  Future<List<Receveur>> get4Recents(Bus bus);
  Future<ListPaginate<Receveur>> findAll(String text, int page);
  Future<Receveur> save(Receveur receveur);

}