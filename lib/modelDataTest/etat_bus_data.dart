import 'package:captrans_regulateur/model/etat_bus.dart';
import 'package:noppal_util/model/gen_data_array_impl.dart';
import 'package:noppal_util/model/gen_etat.dart';
import 'package:noppal_util/model/gen_nombre.dart';

class EtatBusData extends GenDataArrayImpl<EtatBus>{
  int taille;
  EtatBusData(this.taille);

  @override
  List<EtatBus> getData() {
    GenEtat<int> prixCaptranse=GenEtat([1200,1300,1500,1750,1900,2000]);
    GenEtat<int> prixGie=GenEtat([1000,700,500,750,900,800]);
    GenEtat<int> prixSpecialCaptranse=GenEtat([0,1500]);
    GenEtat<int> prixSpecialGie=GenEtat([0,1000]);
    GenNombre prixSupplementaire=GenNombre(500,10000,pas: 500);
    GenEtat<String> nomGie = GenEtat(['Sope Nabi','Noumbélane','Wa keur sering diw']);
    return List.generate(taille, (index) {
      return EtatBus(
        id:index,
        prixCaptrans: prixCaptranse.random(),
        prixGie:  prixGie.random(),
        prixSpecialCaptrans: prixSpecialCaptranse.random(),
        prixSpecialGie: prixSpecialGie.random(),
        prixSupplementaire: prixSupplementaire.random(),
        nomGie:nomGie.random(),
        dateVigueurGie: DateTime.now(),
        dateVigueurCaptrans: DateTime.now(),
      );
    });
  }
}