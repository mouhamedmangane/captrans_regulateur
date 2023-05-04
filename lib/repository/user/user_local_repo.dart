


import 'package:captrans_regulateur/model/user.dart';
import 'package:noppal_util/repository/local_repo_string.dart';
import 'package:noppal_util/repository/local_reposiroty.dart';
import 'package:noppal_util/repository/local_repo_object_item.dart';
import 'package:noppal_util/repository/npl_treat_request_exception.dart';

class UserLocalRepo extends NplLocalReposiroty{
  LocalRepoObjectItem<User> userDriver= LocalRepoObjectItem(
    key: "user_object",
    create: (json)=>User.fromJson(json),
  );
  LocalRepoStringItem isLoadedPhotoDriver=LocalRepoStringItem('user_loaded_photo_profil');


  UserLocalRepo():super("user");
  
  Future<void> save(User user)async{
    set<User>(userDriver,user);
  }

  Future<User> getUser()async{
    User? user;
    await get(userDriver).then((value) { user = value;}).catchError((err) {user = null;});
    if(user != null)
      return user!;
    else
      throw NplTreatRequestException("Impossible de recuperer l'utilisateur.");
  }

  Future<String?> isLoadedPhoto()async {
    return await get(isLoadedPhotoDriver);

  }

  Future<void> saveLoadedPhoto(String state)async {
    set(isLoadedPhotoDriver,state);
  }


}