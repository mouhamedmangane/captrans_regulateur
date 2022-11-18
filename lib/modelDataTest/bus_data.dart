// ignore: file_names
import 'package:captrans_regulateur/model/bus.dart';
import 'package:captrans_regulateur/model/proprietaire.dart';
import 'package:captrans_regulateur/modelDataTest/nom_gie_data.dart';
import 'package:captrans_regulateur/modelDataTest/proprietaire_data.dart';
import 'package:noppal_util/model/gen_data_array_impl.dart';
import 'package:noppal_util/model/gen_date_time.dart';
import 'package:noppal_util/model/gen_etat.dart';
import 'package:noppal_util/model/gen_id.dart';
import 'package:noppal_util/model/gen_mat_auto.dart';
import 'package:noppal_util/model/gen_nom.dart';
import 'package:noppal_util/model/gen_nom_complet.dart';
import 'package:noppal_util/model/gen_nombre.dart';
class BusData extends GenDataArrayImpl<Bus>{
  int taille;
  BusData(this.taille);
  @override
  List<Bus> getData() {
    GenMatAuto matricule=GenMatAuto();
    GenNombre jourEtat=GenNombre(-100,100);
    NomGieData nomGie=NomGieData();
    GenNombre montantEtat=GenNombre(1500,500000,pas: 500);
    GenEtat<int> compte=GenEtat([1200,1300,1500,1750,1900,2000]);
    GenDateTime lasteDate=GenDateTime(start: DateTime.now());
    GenNombre numroLigne=GenNombre(1,70);
    ProprietaireData proprietaire=ProprietaireData(taille);
    return List.generate(taille, (index) {
      int m_etat=jourEtat.random();
      return Bus(
        id: index,
        matricule: matricule.next(),
        compte: m_etat*compte.next(),
        numeroLigne: numroLigne.random(),
        proprietaireId: numroLigne.random(),
        nomGie:nomGie.random() ,
        jourEtat: m_etat,
        montantEtat: montantEtat.random(),
        lastDateCotisation: lasteDate.next(),
        proprietaire: proprietaire.next(),
      );
    });
  }


}