// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Bus _$$_BusFromJson(Map<String, dynamic> json) => _$_Bus(
      id: json['id'] as int,
      compte: json['compte'] as int,
      matricule: json['matricule'] as String,
      proprietaireId: json['proprietaireId'] as int,
      numeroLigne: json['numeroLigne'] as int,
      marque: json['marque'] as String?,
      lastDateCotisation: json['lastDateCotisation'] == null
          ? null
          : DateTime.parse(json['lastDateCotisation'] as String),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      jourEtat: json['jourEtat'] as int?,
      montantEtat: json['montantEtat'] as int?,
      nomGie: json['nomGie'] as String?,
      proprietaire: json['proprietaire'] == null
          ? null
          : Proprietaire.fromJson(json['proprietaire'] as Map<String, dynamic>),
      receveurs: (json['receveurs'] as List<dynamic>?)
          ?.map((e) => Receveur.fromJson(e as Map<String, dynamic>))
          .toList(),
      etatBus: (json['etatBus'] as List<dynamic>?)
          ?.map((e) => EtatBus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BusToJson(_$_Bus instance) => <String, dynamic>{
      'id': instance.id,
      'compte': instance.compte,
      'matricule': instance.matricule,
      'proprietaireId': instance.proprietaireId,
      'numeroLigne': instance.numeroLigne,
      'marque': instance.marque,
      'lastDateCotisation': instance.lastDateCotisation?.toIso8601String(),
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'jourEtat': instance.jourEtat,
      'montantEtat': instance.montantEtat,
      'nomGie': instance.nomGie,
      'proprietaire': instance.proprietaire,
      'receveurs': instance.receveurs,
      'etatBus': instance.etatBus,
    };
