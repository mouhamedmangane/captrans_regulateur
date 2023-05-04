
  import 'package:flutter/foundation.dart';
  import 'package:captrans_regulateur/model/etat_bus.dart';
  import 'package:captrans_regulateur/model/receveur.dart';
  import 'package:captrans_regulateur/model/proprietaire.dart';
  import 'package:freezed_annotation/freezed_annotation.dart';

  part 'bus.freezed.dart';

  part 'bus.g.dart';


  @Freezed()
  class Bus with _$Bus{
    const factory Bus({

      required int id,
      int ? compte,
      required String matricule,
      int ? proprietaireId,
      required String numeroLigne,
      String ? marque,
      DateTime ? lastDateCotisation,
      DateTime ? createdAt,
      DateTime ? dateEnVigueur,
      DateTime ? updatedAt,
      int ? jourEtat,
      int ? montantEtat,
      String ? nomGie,
      Proprietaire ? proprietaire,
      List<Receveur> ? receveurs,
      List<EtatBus> ? etatBus,
    }) = _Bus;

    factory Bus.fromJson(Map<String,dynamic> json) => _$BusFromJson(json);
  }