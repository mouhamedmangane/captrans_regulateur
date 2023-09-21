// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cotisation_global_info_jour_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CotisationGlobalInfoJour _$$_CotisationGlobalInfoJourFromJson(
        Map<String, dynamic> json) =>
    _$_CotisationGlobalInfoJour(
      jour: DateTime.parse(json['jour'] as String),
      montant: (json['montant'] as num).toDouble(),
      nombre:(json['nombre'] is String) ? int.parse(json['nombre']): json['nombre'] as int,
    );

Map<String, dynamic> _$$_CotisationGlobalInfoJourToJson(
        _$_CotisationGlobalInfoJour instance) =>
    <String, dynamic>{
      'jour': instance.jour.toIso8601String(),
      'montant': instance.montant,
      'nombre': instance.nombre,
    };
