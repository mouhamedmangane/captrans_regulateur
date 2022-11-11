


import 'package:captrans_regulateur/model/bus.dart';
import 'package:captrans_regulateur/model/ligne_cotisation.dart';
import 'package:captrans_regulateur/model/receveur.dart';
import 'package:captrans_regulateur/model/user.dart';
import 'package:captrans_regulateur/modelDataTest/ligne_cotisation_data.dart';
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
    required DateTime dateDebut,
    required DateTime dateFin,
    DateTime ? created_at,
    DateTime ? updated_at,
    required int regulateurId,
    required int receveurId,
    required int busId,
    User ? regulateur,
    Bus ? bus,
    Receveur ? receveur,
    List<LigneCotisation> ? ligneCotisations,

  }) = _Cotisation;

  factory Cotisation.fromJson(Map<String, dynamic> json) =>
      _$CotisationFromJson(json);

  int interValJour(){
    return dateDebut.difference(dateFin).inDays;
  }
}
