import 'package:freezed_annotation/freezed_annotation.dart';

part 'cotisation_resume.freezed.dart';
part 'cotisation_resume.g.dart';

@Freezed()
class CotisationResume with _$CotisationResume {
  const factory CotisationResume({
    required double montantVerser,
    required int jourEtat,
    required int  montantEtat,
    required double compte,
    required DateTime date,
  }) = _CotisationResume;

  factory CotisationResume.fromJson(Map<String, dynamic> json) =>
      _$CotisationResumeFromJson(json);
}
