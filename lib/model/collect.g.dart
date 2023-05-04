// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Collect _$$_CollectFromJson(Map<String, dynamic> json) => _$_Collect(
      id: json['id'] as int,
      montant: json['montant'] as int,
      collecteurId: json['collecteur_id'] as int?,
      regulateurId: json['regulateur_id'] as int?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      profil: json['profil'] as String?,
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
      'collecteur_id': instance.collecteurId,
      'regulateur_id': instance.regulateurId,
      'date': instance.date?.toIso8601String(),
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'profil': instance.profil,
      'collecteur': instance.collecteur,
      'regulateur': instance.regulateur,
      'cotisations': instance.cotisations,
    };
