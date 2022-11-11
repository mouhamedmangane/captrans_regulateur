

import 'package:freezed_annotation/freezed_annotation.dart';


part 'ligne_cotisation.freezed.dart';
part 'ligne_cotisation.g.dart';

@Freezed()
class LigneCotisation with _$LigneCotisation{
  const factory LigneCotisation({
    required int id,
    required int nombreDeDepot,
    DateTime ? created_at,
    DateTime ? updated_at,

    required int etatBusId,
    required int cotisationId,

    required int prixGie,
    required int prixCaptrans,
    int ? prixSupplementaire,
    required String nomGie,

  }) = _LigneCotisation;

  factory LigneCotisation.fromJson(Map<String, dynamic> json) =>
      _$LigneCotisationFromJson(json);
}