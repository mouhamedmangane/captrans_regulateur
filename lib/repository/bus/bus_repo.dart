import 'package:noppal_util/dto/list_paginate.dart';

import '../../model/bus.dart';

abstract class BusRepo{
  Future<Bus> findBusByMat(String matricule);
  Future<ListPaginate<Bus>> findAll(String text,int page);

}