


import 'package:freezed_annotation/freezed_annotation.dart';

part 'receveur.freezed.dart';
part 'receveur.g.dart';

@Freezed()
class Receveur with _$Receveur {
  const factory Receveur({
    required int id,
    required String nom,
    required String tel,
  }) = _Receveur;

  factory Receveur.fromJson(Map<String, dynamic> json) =>
      _$ReceveurFromJson(json);
}
