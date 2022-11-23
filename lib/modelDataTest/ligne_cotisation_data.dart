import 'package:captrans_regulateur/model/ligne_cotisation.dart';
import 'package:noppal_util/model/gen_data_array_impl.dart';
import 'package:noppal_util/model/gen_etat.dart';
import 'package:noppal_util/model/gen_nombre.dart';

class LigneCotisationData extends GenDataArrayImpl<LigneCotisation>{
  int taille;
  LigneCotisationData(this.taille);

  @override
  List<LigneCotisation> getData() {
    GenNombre nombre=GenNombre(1,100,pas: 3);
    GenEtat<int> prixCaptranse=GenEtat([1200,1300,1500,1750,1900,2000]);
    GenEtat<int> prixGie=GenEtat([1000,700,500,750,900,800]);;
    GenNombre prixSupplementaire=GenNombre(500,10000,pas: 500);
    GenEtat<String> nomGie = GenEtat(['Sope Nabi','Noumbélane','Wa keur sering diw']);

    return List.generate(taille, (index) {
      int pCap=prixCaptranse.random();
      int pGie=prixGie.random();
      int pSup=prixSupplementaire.random();
         return LigneCotisation(
        id: index,
        nombreDeDepot: nombre.random(),
        etatBusId: nombre.random(),
        cotisationId:  nombre.random(),
        prixGie: pGie,
        prixCaptrans: pCap,
        prixSupplementaire: pSup,
        total: pCap+pSup+pGie,
         dateDebut: DateTime.now(),
         dateFin: DateTime.now()
      );
    });
  }

}