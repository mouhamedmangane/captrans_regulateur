import 'package:captrans_regulateur/model_dto/cotisation_resume.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/bus.dart';
import '../model/cotisation.dart';

part 'cotisation_success.freezed.dart';
part 'cotisation_success.g.dart';

@Freezed()
class CotisationSuccess with _$CotisationSuccess {
  const factory CotisationSuccess({
    required Bus bus,
    required Cotisation  cotisation,
    Cotisation  ? cotisationAuto,
    CotisationResume ? lastCotisation,
    int ? montantEncaisser,
  }) = _CotisationSuccess;

  factory CotisationSuccess.fromJson(Map<String, dynamic> json) =>
      _$CotisationSuccessFromJson(json);
}
