
import 'package:captrans_regulateur/model/user.dart';
import 'package:noppal_util/model/gen_data.dart';
import 'package:noppal_util/model/gen_data_array_impl.dart';
import 'package:noppal_util/model/gen_etat.dart';
import 'package:noppal_util/model/gen_id.dart';
import 'package:noppal_util/model/gen_nom_complet.dart';
import 'package:noppal_util/model/gen_nombre.dart';
import 'package:noppal_util/model/gen_prenom.dart';

class UserData extends GenDataArrayImpl<User>{
  int taille;
  UserData(this.taille);


  @override
  List<User> getData() {
    GenId id=GenId();
    GenNomComplet nom=GenNomComplet(taille);
    GenPreNom login=GenPreNom();
    GenNombre genTel=GenNombre(771234567,779999999);
    GenEtat<String> role=GenEtat(['regulateur','collecteur']);
    GenEtat<String> adresse=GenEtat(['876 Rue 10','87 Pikine maka colonae','273 guédiawaye','87 Fann Hann']);
    return List.generate(taille, (index) => User(
      id: id.next(),
      nom: nom.next(),
      adresse: adresse.random(),
      login: '${login.random()}@captrans.com',
      tel:genTel.random().toString(),
      email: login.random(),

      foncion: role.next(),

    ));
  }

}