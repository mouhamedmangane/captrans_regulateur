import 'package:captrans_regulateur/model/bus.dart';
import 'package:captrans_regulateur/model/cotisation.dart';
import 'package:captrans_regulateur/model/ligne_cotisation.dart';
import 'package:captrans_regulateur/model/receveur.dart';
import 'package:captrans_regulateur/model/user.dart';
import 'package:captrans_regulateur/modelDataTest/bus_data.dart';
import 'package:captrans_regulateur/modelDataTest/ligne_cotisation_data.dart';
import 'package:captrans_regulateur/modelDataTest/receveur_data.dart';
import 'package:captrans_regulateur/modelDataTest/user_data.dart';
import 'package:noppal_util/model/gen_data_array_impl.dart';
import 'package:noppal_util/model/gen_nombre.dart';

class CotisationData extends GenDataArrayImpl<Cotisation>{
  int taille;
  CotisationData(this.taille);

  @override
  List<Cotisation> getData() {
   GenNombre nLigneCotisation=GenNombre(1,4);
   GenNombre montant= GenNombre(100, 800,pas: 100);
   GenNombre nombre=GenNombre(1,7);
   BusData buss=BusData(taille);
   UserData users= UserData(taille);
   ReceveurData receveurs= ReceveurData(taille);
   return List.generate(taille, (index) {
     List<LigneCotisation> ligneCotisations= LigneCotisationData(nLigneCotisation.random()).getData();
     int somme= sommeTotal(ligneCotisations);
     int nDay=nombreTotal(ligneCotisations);
     User regulateur=users.next();
     Receveur receveur=receveurs.next();
     Bus bus = buss.next();
      return Cotisation(
        id: index,
        montantCotiser: somme,
        montant: somme+montant.random(),
        dateDebut: DateTime.now().subtract(Duration(days: nDay)),
        dateFin: DateTime.now(),
        regulateurId: regulateur.id ,
        receveurId:receveur.id ,
        bus:bus,
        receveur: receveur,
        regulateur: regulateur,
        ligneCotisations: ligneCotisations,
        busId: bus.id,
      );
   });
  }

  int sommeTotal(List<LigneCotisation> lgCotisation){
    int s=0;
    for (var element in lgCotisation) {
      s+=(element.prixCaptrans+element.prixGie) * element.nombreDeDepot;
    };
    return s;
  }

  int nombreTotal(List<LigneCotisation> lgCotisation){
    int s=0;
    for (var element in lgCotisation) {
      s+element.nombreDeDepot;
    };
    return s;
  }
  
}