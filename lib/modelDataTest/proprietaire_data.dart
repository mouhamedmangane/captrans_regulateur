

import 'package:captrans_regulateur/model/proprietaire.dart';
import 'package:noppal_util/model/gen_data_array_impl.dart';
import 'package:noppal_util/model/gen_nom_complet.dart';
import 'package:noppal_util/model/gen_nombre.dart';

class ProprietaireData extends GenDataArrayImpl<Proprietaire>{
   int taille;
  ProprietaireData(this.taille);

  @override
  List<Proprietaire> getData() {
    GenNomComplet genNomComplet=GenNomComplet(taille);
    GenNombre genTel=GenNombre(771234567,779999999);

    return List.generate(taille, (index)  {
      return Proprietaire(
        id: index,
        nom: genNomComplet.next(),
        tel: genTel.random().toString(),
      );

    });
  }
}