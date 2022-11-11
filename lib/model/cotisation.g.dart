// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cotisation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cotisation _$$_CotisationFromJson(Map<String, dynamic> json) =>
    _$_Cotisation(
      id: json['id'] as int,
      montant: json['montant'] as int,
      montantCotiser: json['montantCotiser'] as int,
      dateDebut: DateTime.parse(json['dateDebut'] as String),
      dateFin: DateTime.parse(json['dateFin'] as String),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      regulateurId: json['regulateurId'] as int,
      receveurId: json['receveurId'] as int,
      busId: json['busId'] as int,
      regulateur: json['regulateur'] == null
          ? null
          : User.fromJson(json['regulateur'] as Map<String, dynamic>),
      bus: json['bus'] == null
          ? null
          : Bus.fromJson(json['bus'] as Map<String, dynamic>),
      receveur: json['receveur'] == null
          ? null
          : Receveur.fromJson(json['receveur'] as Map<String, dynamic>),
      ligneCotisations: (json['ligneCotisations'] as List<dynamic>?)
          ?.map((e) => LigneCotisation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CotisationToJson(_$_Cotisation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'montant': instance.montant,
      'montantCotiser': instance.montantCotiser,
      'dateDebut': instance.dateDebut.toIso8601String(),
      'dateFin': instance.dateFin.toIso8601String(),
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'regulateurId': instance.regulateurId,
      'receveurId': instance.receveurId,
      'busId': instance.busId,
      'regulateur': instance.regulateur,
      'bus': instance.bus,
      'receveur': instance.receveur,
      'ligneCotisations': instance.ligneCotisations,
    };
