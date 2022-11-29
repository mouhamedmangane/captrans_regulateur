

import 'package:noppal_util/repository/local_repo_item_bool.dart';
import 'package:noppal_util/repository/local_reposiroty.dart';

class AppLocalRepo extends NplLocalReposiroty{
  LocalRepoItemBool localRepoItemBool=LocalRepoItemBool('has_connected');
  AppLocalRepo():super('app');

  Future<bool> has_connected()async{
    bool rt=false;
    await get(localRepoItemBool).then((value) {
      rt=true;
    }).catchError((err){});
    return rt;

  }

  Future<void> save_connected() async{
    set(localRepoItemBool,true);
  }


  Future<void> deconnexion()async{
    cleanAll();
  }

}