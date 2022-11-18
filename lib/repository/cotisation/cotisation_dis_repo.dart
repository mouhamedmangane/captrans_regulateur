import 'dart:convert';

import 'package:captrans_regulateur/model/cotisation.dart';
import 'package:captrans_regulateur/repository/cotisation/cotisation_repo.dart';
import 'package:noppal_util/repository/dis_repo.dart';
import 'package:noppal_util/repository/npl_treat_request.dart';

import '../../model_dto/cotisation_save.dart';

class CotisationDisRepo extends DisRepo implements CotisationRepo{


  NplTreatRequest treatRequest=new NplTreatRequest();

  CotisationDisRepo() : super();

  @override
  Future<Cotisation> add(CotisationSave cotisationSave) async{
    return postRequest<Cotisation>(
        'cotisation',
        cotisationSave.toJson(),
        (json) => treatRequest.make<Cotisation>(json)
    );
  }

  @override
  Future<List<Cotisation>> en_cours() {
    return getRequest('cotisation/en_cours',
            (json) => treatRequest.makeList(json)
    );
  }

  @override
  Future<int?> sommeTotal() {
    return getRequest('cotisation/en_cours',
            (json) => treatRequest.make<int>(json)
    );
  }

  @override
  Future<Cotisation> getComplete(Cotisation cotisation) {
    return getRequest('cotisation/${cotisation.id}',
        (json) => treatRequest.make<Cotisation>(json)
    );
  }
  

}