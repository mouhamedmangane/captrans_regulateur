

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cotisation_global_info_jour_dto.freezed.dart';
part 'cotisation_global_info_jour_dto.g.dart';


@Freezed()
class CotisationGlobalInfoJour  with _$CotisationGlobalInfoJour{
  const factory CotisationGlobalInfoJour({
    required DateTime jour,
    required double montant,
    required int nombre,
  }) = _CotisationGlobalInfoJour;

  factory CotisationGlobalInfoJour.fromJson(Map<String, dynamic> json) =>
      _$CotisationGlobalInfoJourFromJson(json);
}