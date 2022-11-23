// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ligne_cotisation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LigneCotisation _$$_LigneCotisationFromJson(Map<String, dynamic> json) =>
    _$_LigneCotisation(
      id: json['id'] as int,
      nombreDeDepot: json['nombreDeDepot'] as int,
      dateDebut: json['dateDebut'] == null
          ? null
          : DateTime.parse(json['dateDebut'] as String),
      dateFin: json['dateFin'] == null
          ? null
          : DateTime.parse(json['dateFin'] as String),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      etatBusId: json['etatBusId'] as int,
      cotisationId: json['cotisationId'] as int,
      prixGie: json['prixGie'] as int,
      prixCaptrans: json['prixCaptrans'] as int,
      prixSupplementaire: json['prixSupplementaire'] as int?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$$_LigneCotisationToJson(_$_LigneCotisation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombreDeDepot': instance.nombreDeDepot,
      'dateDebut': instance.dateDebut?.toIso8601String(),
      'dateFin': instance.dateFin?.toIso8601String(),
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'etatBusId': instance.etatBusId,
      'cotisationId': instance.cotisationId,
      'prixGie': instance.prixGie,
      'prixCaptrans': instance.prixCaptrans,
      'prixSupplementaire': instance.prixSupplementaire,
      'total': instance.total,
    };
