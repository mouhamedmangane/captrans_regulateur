

import 'package:freezed_annotation/freezed_annotation.dart';


part 'ligne_cotisation.freezed.dart';
part 'ligne_cotisation.g.dart';

@Freezed()
class LigneCotisation with _$LigneCotisation{
  const LigneCotisation._();
  const factory LigneCotisation({
    required int id,
    required int nombreDeDepot,
    DateTime ? dateDebut,
    DateTime ? dateFin,
    DateTime ? created_at,
    DateTime ? updated_at,

    int ? etatBusId,
    int ? cotisationId,

    required int prixGie,
    required int prixCaptrans,
    int ? prixSupplementaire,
    int ? total,

  }) = _LigneCotisation;

  factory LigneCotisation.fromJson(Map<String, dynamic> json) =>
      _$LigneCotisationFromJson(json);

  int prixTotal(){
    return prixGie+prixCaptrans+(prixSupplementaire??0);
  }
}