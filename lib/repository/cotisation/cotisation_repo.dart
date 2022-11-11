

import 'package:captrans_regulateur/model/cotisation.dart';
import 'package:captrans_regulateur/model_dto/cotisation_save.dart';

abstract class CotisationRepo{

  Future<int?> sommeTotal();
  Future<Cotisation> add(CotisationSave cotisationSave);
  Future<List<Cotisation>> en_cours();
}