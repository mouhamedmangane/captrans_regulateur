


import 'package:freezed_annotation/freezed_annotation.dart';

part 'etat_bus.freezed.dart';
part 'etat_bus.g.dart';


@Freezed()
class EtatBus with _$EtatBus{
  const factory EtatBus({

    required int  id,
    required int  prixSpecialCaptrans,
    required int  prixSpecialGie,

    required int prixGie,
    required DateTime dateVigueurGie,
    required int prixCaptrans,
    required DateTime dateVigueurCaptrans,
    bool ? enCours,
    required String nomGie,

    int ? prixSupplementaire,
    String ? commentaire,
    DateTime ? created_at,
    DateTime ? updated_at,

  })= _EtatBus;

  factory EtatBus.fromJson(Map<String, dynamic> json) =>
      _$EtatBusFromJson(json);
}