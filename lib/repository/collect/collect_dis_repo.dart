


import 'package:captrans_regulateur/model/collect.dart';
import 'package:captrans_regulateur/repository/collect/collect_repo.dart';
import 'package:noppal_util/repository/dis_repo.dart';
import 'package:noppal_util/repository/npl_treat_request.dart';

class CollectDisRepo extends DisRepo implements CollectRepo{
  NplTreatRequest treatRequest=new NplTreatRequest();

  @override
  Future<List<Collect>> findLastCollects(int regulateurId) {
    return getRequest('collect/last_collect_user/${regulateurId}',
            (json) => treatRequest.makeList(json)
    );
  }

}