


import 'package:captrans_regulateur/model/collect.dart';
import 'package:captrans_regulateur/repository/collect/collect_repo.dart';
import 'package:noppal_util/converter/npl_converter_object.dart';
import 'package:noppal_util/repository/dis_repo.dart';
import 'package:noppal_util/repository/npl_treat_request.dart';

class CollectDisRepo extends DisRepo implements CollectRepo{
  NplTreatRequest treatRequest=new NplTreatRequest();
  NplConverterObject<Collect> converterCotisation=NplConverterObject((p0) => Collect.fromJson(p0));

  @override
  Future<List<Collect>> findLastCollects(int regulateurId) {
    return getRequest('api/collectes/regulateur/${regulateurId}',
            (json) => treatRequest.makeListObject(json,converterCotisation)
    );
  }

}