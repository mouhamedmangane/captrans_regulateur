

import 'package:captrans_regulateur/model_dto/connexion_dto.dart';
import 'package:noppal_util/repository/dis_repo.dart';
import 'package:noppal_util/repository/npl_treat_request.dart';

import '../../model/user.dart';

class UserDisRepo extends DisRepo{
  NplTreatRequest treatRequest=NplTreatRequest();

  Future<User> connexionRegulateur(ConnexionDto connexionDto){
    return postRequest('connexion/regulateur',
        connexionDto.,
            (p0) => treatRequest.make(p0)
    );
  }

  Future<User> deverouillage(STring password){

  }

  Future<User> savelocal(User user){

  }

}