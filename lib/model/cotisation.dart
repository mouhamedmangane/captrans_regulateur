


import 'package:captrans_regulateur/model/bus.dart';
import 'package:captrans_regulateur/model/ligne_cotisation.dart';
import 'package:captrans_regulateur/model/receveur.dart';
import 'package:captrans_regulateur/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cotisation.freezed.dart';
part 'cotisation.g.dart';

@Freezed()
class Cotisation with _$Cotisation{
  const Cotisation._();
  const factory Cotisation({
    required int id,
    required int montant,
    required int montantCotiser,
    DateTime ? dateDebut,
    DateTime ? dateFin,
    DateTime ? createdAt,
    DateTime ? updatedAt,
    int ? regulateurId,
    int ? receveurId,
    int ?  busId,
    User ? regulateur,
    Bus ? bus,
    Receveur ? receveur,
    List<LigneCotisation> ? ligneCotisations,

    int ? compte,
    int ? jourEtat,
    int ? montantEtat,

  }) = _Cotisation;

  factory Cotisation.fromJson(Map<String, dynamic> json) =>
      _$CotisationFromJson(json);

  int interValJour(){
    int cpt=0;
    if(ligneCotisations!=null){
      for(LigneCotisation ligneCotisation in ligneCotisations!){
        cpt+=ligneCotisation.nombreDeDepot;
      }
    }

    return cpt;
  }

  int nombreTotalDeJour(){
    int somme=0;
    if(ligneCotisations!=0){
      ligneCotisations!.forEach((element) {
        somme+=element.nombreDeDepot;
      });
    }
    return somme;
  }
}
