

import 'package:captrans_regulateur/model/collect.dart';
import 'package:captrans_regulateur/model/user.dart';
import 'package:captrans_regulateur/modelDataTest/user_data.dart';
import 'package:noppal_util/model/gen_data_array_impl.dart';
import 'package:noppal_util/model/gen_date_time.dart';
import 'package:noppal_util/model/gen_id.dart';
import 'package:noppal_util/model/gen_nombre.dart';

class CollectData extends GenDataArrayImpl<Collect>{
  int taille;

  CollectData(this.taille);


  @override
  List<Collect> getData() {
    GenId id=GenId();
    UserData user= UserData(taille+1);
    GenNombre montant=GenNombre(50000, 250000,pas: 5000);
    GenDateTime date=GenDateTime(start: DateTime.now().subtract(Duration(days: taille+1)));

    return List.generate(taille, (index) {
      User m_regulateur=user.next();
      User m_collecteur=user.next();
      return Collect(
        id: id.next(),
        regulateur: m_regulateur,
        regulateurId: m_regulateur.id,
        collecteur: m_collecteur,
        collecteurId: m_collecteur.id,
        montant: montant.next(),
        created_at: date.next(),
      );
    });
  }
}