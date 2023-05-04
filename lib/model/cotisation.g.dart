// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cotisation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cotisation _$$_CotisationFromJson(Map<String, dynamic> json) =>
    _$_Cotisation(
      id: json['id'] as int,
      montant: json['montant'] as int,
      montantCotiser: json['montant_cotiser'] as int,
      dateDebut: json['date_debut'] == null
          ? null
          : DateTime.parse(json['date_debut'] as String),
      dateFin: json['date_fin'] == null
          ? null
          : DateTime.parse(json['date_fin'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      regulateurId: json['regulateur_id'] as int?,
      receveurId: json['receveur_id'] as int?,
      busId: json['bus_id'] as int?,
      regulateur: json['regulateur'] == null
          ? null
          : User.fromJson(json['regulateur'] as Map<String, dynamic>),
      bus: json['bus'] == null
          ? null
          : Bus.fromJson(json['bus'] as Map<String, dynamic>),
      receveur: json['receveur'] == null
          ? null
          : Receveur.fromJson(json['receveur'] as Map<String, dynamic>),
      ligneCotisations: (json['ligne_cotisations'] as List<dynamic>?)
          ?.map((e) => LigneCotisation.fromJson(e as Map<String, dynamic>))
          .toList(),
      compte: json['compte'] as int?,
      jourEtat: json['jour_etat'] as int?,
      montantEtat: json['montant_etat'] as int?,
    );

Map<String, dynamic> _$$_CotisationToJson(_$_Cotisation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'montant': instance.montant,
      'montant_cotiser': instance.montantCotiser,
      'date_debut': instance.dateDebut?.toIso8601String(),
      'date_fin': instance.dateFin?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'regulateur_id': instance.regulateurId,
      'receveur_id': instance.receveurId,
      'bus_id': instance.busId,
      'regulateur': instance.regulateur,
      'bus': instance.bus,
      'receveur': instance.receveur,
      'ligne_cotisations': instance.ligneCotisations,
      'compte': instance.compte,
      'jour_etat': instance.jourEtat,
      'montant_etat': instance.montantEtat,
    };
