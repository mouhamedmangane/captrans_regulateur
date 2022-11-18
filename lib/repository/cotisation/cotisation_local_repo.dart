
import 'package:captrans_regulateur/model/cotisation.dart';
import 'package:noppal_util/repository/local_repo_int_item.dart';
import 'package:noppal_util/repository/local_reposiroty.dart';

import '../../model_dto/cotisation_save.dart';
import 'cotisation_repo.dart';

class CotisationLocalRepo extends NplLocalReposiroty implements CotisationRepo{
  final LocalRepoIntItem _somme_total_item=LocalRepoIntItem("somme_total");

  CotisationLocalRepo() : super("cotisation");

  @override
  Future<Cotisation> add(CotisationSave cotisationsave) {
    throw UnimplementedError();
  }

  @override
  Future<List<Cotisation>> en_cours() {
    // TODO: implement en_cours
    throw UnimplementedError();
  }

  @override
  Future<int?> sommeTotal() async {
    return get<int?>(_somme_total_item);
  }

  Future<void> setSommeTotal(int value)async{
    return set<int?>(_somme_total_item,value);
  }

  @override
  Future<Cotisation> getComplete(Cotisation cotisation) {
    // TODO: implement getComplete
    throw UnimplementedError();
  }

}