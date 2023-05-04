import 'package:flutter/foundation.dart';
import 'package:captrans_regulateur/model/cotisation.dart';
import 'package:captrans_regulateur/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'collect.freezed.dart';
part 'collect.g.dart';

@Freezed()
class Collect with _$Collect {
  const factory Collect({

    required int id,
    required int montant,
    int ? collecteurId,
    int ? regulateurId,
    DateTime ? date,
    DateTime ? created_at,
    DateTime ? updated_at,
    String ? profil,


    User ? collecteur,
    User ? regulateur,
    List<Cotisation> ? cotisations,


  })= _Collect;

  factory Collect.fromJson(Map<String, dynamic> json) =>
      _$CollectFromJson(json);
}

