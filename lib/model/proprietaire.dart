
import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'proprietaire.freezed.dart';

part 'proprietaire.g.dart';

@Freezed()
class Proprietaire with _$Proprietaire {
  const factory Proprietaire({
    required int id,
    required String nom,
    required String tel,
  }) = _Proprietaire;

  factory Proprietaire.fromJson(Map<String,dynamic> json) => _$ProprietaireFromJson(json);

}