
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cotisation_save.freezed.dart';
part 'cotisation_save.g.dart';

@Freezed()
class CotisationSave with _$CotisationSave {
  const factory CotisationSave({
    required int regulateurId,
    required int receveurId,
    required int busId,
    required int montant,
  }) = _CotisationSave;

  factory CotisationSave.fromJson(Map<String, dynamic> json) =>
      _$CotisationSaveFromJson(json);
}
