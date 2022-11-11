

import 'package:captrans_regulateur/model/receveur.dart';
import 'package:noppal_util/model/gen_data_array_impl.dart';
import 'package:noppal_util/model/gen_nom_complet.dart';
import 'package:noppal_util/model/gen_nombre.dart';

class ReceveurData extends GenDataArrayImpl<Receveur>{
  int taille;
  ReceveurData(this.taille);

  @override
  List<Receveur> getData() {
    GenNomComplet genNomComplet=GenNomComplet(taille);
    GenNombre genTel=GenNombre(771234567,779999999);

    return List.generate(taille, (index) {
      return Receveur(
      id: index,
      nom: genNomComplet.next(),
      tel: genTel.random().toString(),
    );

  });
  }
}