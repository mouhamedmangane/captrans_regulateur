
import 'package:image_picker/image_picker.dart';
import 'package:captrans_regulateur/model_dto/connexion_dto.dart';
import 'package:noppal_util/converter/npl_converter_object.dart';
import 'package:noppal_util/repository/dis_repo.dart';
import 'package:noppal_util/repository/npl_treat_request.dart';

import '../../model/user.dart';

class UserDisRepo extends DisRepo{
  NplTreatRequest treatRequest=NplTreatRequest();
  NplConverterObject<User> converter=NplConverterObject((p0) => User.fromJson(p0));
  Future<User> connexionRegulateur(ConnexionDto connexionDto){
    return postRequest('api/regulateur/connexion',
        connexionDto.toJson(),
            (p0) => treatRequest.makeObject(p0,converter),
      needToken: false,
    );
  }

  Future<bool> changePwd(int userId,String ancien,String nouveau,String confirmation){
    return postRequest('api/users/changer-password',{
      "password":ancien,
      "new_password":nouveau,
      "new_password_confirmation":confirmation,
    }, (p0) => treatRequest.make(p0)
    );
  }

  Future<String> code(int userId){
    return getRequest('api/users/code/$userId',
            (json) => treatRequest.make(json)
    );
  }

  Future<dynamic> changeImage(int id,XFile image) async{
    return postMultiPartRequest('api/users/change-profil',
            (p0) => treatRequest.make(p0),
        files: {'image':image.path}
    );
  }

  Future<bool> saveTokenFcm(int id,String token) async{
    return postRequest(
        'api/users/save_token_fcm',
        {'id':id,'token':token,'app':'regulateur'},
        (p0) => treatRequest.make(p0)
    );
  }

  Future<List<String>> getLignes() async{
    return getRequest(
        'api/lignes/get-lignes',
        (p0) => treatRequest.makeList(p0)
    );
  }


}