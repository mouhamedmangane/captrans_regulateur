// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ligne_cotisation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LigneCotisation _$$_LigneCotisationFromJson(Map<String, dynamic> json) =>
    _$_LigneCotisation(
      id: json['id'] as int,
      nombreDeDepot: json['nombre_de_depot'] as int,
      dateDebut: json['date_debut'] == null
          ? null
          : DateTime.parse(json['date_debut'] as String),
      dateFin: json['date_fin'] == null
          ? null
          : DateTime.parse(json['date_fin'] as String),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      etatBusId: json['etat_bus_id'] as int?,
      cotisationId: json['cotisation_id'] as int?,
      prixGie: json['prix_gie'] as int,
      prixCaptrans: json['prix_captrans'] as int,
      prixSupplementaire: json['prix_supplementaire'] as int?,
      total: json['total'] as int?,
    );

Map<String, dynamic> _$$_LigneCotisationToJson(_$_LigneCotisation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombre_de_depot': instance.nombreDeDepot,
      'date_debut': instance.dateDebut?.toIso8601String(),
      'date_fin': instance.dateFin?.toIso8601String(),
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'etat_bus_id': instance.etatBusId,
      'cotisation_id': instance.cotisationId,
      'prix_gie': instance.prixGie,
      'prix_captrans': instance.prixCaptrans,
      'prix_supplementaire': instance.prixSupplementaire,
      'total': instance.total,
    };
