// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Collect _$$_CollectFromJson(Map<String, dynamic> json) => _$_Collect(
      id: json['id'] as int,
      montant: json['montant'] as int,
      collecteurId: json['collecteurId'] as int,
      regulateurId: json['regulateurId'] as int,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      collecteur: json['collecteur'] == null
          ? null
          : User.fromJson(json['collecteur'] as Map<String, dynamic>),
      regulateur: json['regulateur'] == null
          ? null
          : User.fromJson(json['regulateur'] as Map<String, dynamic>),
      cotisations: (json['cotisations'] as List<dynamic>?)
          ?.map((e) => Cotisation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CollectToJson(_$_Collect instance) =>
    <String, dynamic>{
      'id': instance.id,
      'montant': instance.montant,
      'collecteurId': instance.collecteurId,
      'regulateurId': instance.regulateurId,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'collecteur': instance.collecteur,
      'regulateur': instance.regulateur,
      'cotisations': instance.cotisations,
    };
