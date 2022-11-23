


import 'package:captrans_regulateur/model/user.dart';
import 'package:noppal_util/repository/local_reposiroty.dart';
import 'package:noppal_util/repository/local_repo_object_item.dart';

class UserLocalRepo extends NplLocalReposiroty{
  LocalRepoObjectItem<User> userDriver= LocalRepoObjectItem("user_object");

  UserLocalRepo():super("user");
  
  Future<void> save(User user)async{
    set<User>(userDriver,user);
  }

  Future<User> deverouillage(String code)async{
    return await get(userDriver);
  }

}