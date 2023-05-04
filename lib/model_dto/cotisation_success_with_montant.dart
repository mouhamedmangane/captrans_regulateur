

import 'package:captrans_regulateur/model_dto/cotisation_success.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cotisation_success_with_montant.freezed.dart';
part 'cotisation_success_with_montant.g.dart';


@Freezed()
class CotisationSuccessWithMoantant with _$CotisationSuccessWithMoantant {
  const factory CotisationSuccessWithMoantant({
    required CotisationSuccess ticket,
    required int montantEncaisser,
  }) = _CotisationSuccessWithMoantant;

  factory CotisationSuccessWithMoantant.fromJson(Map<String, dynamic> json) =>
      _$CotisationSuccessWithMoantantFromJson(json);
}