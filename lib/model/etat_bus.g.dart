// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'etat_bus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EtatBus _$$_EtatBusFromJson(Map<String, dynamic> json) => _$_EtatBus(
      id: json['id'] as int,
      prixSpecialCaptrans: json['prixSpecialCaptrans'] as int,
      prixSpecialGie: json['prixSpecialGie'] as int,
      prixGie: json['prixGie'] as int,
      dateVigueurGie: DateTime.parse(json['dateVigueurGie'] as String),
      prixCaptrans: json['prixCaptrans'] as int,
      dateVigueurCaptrans:
          DateTime.parse(json['dateVigueurCaptrans'] as String),
      enCours: json['enCours'] as bool?,
      nomGie: json['nomGie'] as String,
      prixSupplementaire: json['prixSupplementaire'] as int?,
      commentaire: json['commentaire'] as String?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$_EtatBusToJson(_$_EtatBus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prixSpecialCaptrans': instance.prixSpecialCaptrans,
      'prixSpecialGie': instance.prixSpecialGie,
      'prixGie': instance.prixGie,
      'dateVigueurGie': instance.dateVigueurGie.toIso8601String(),
      'prixCaptrans': instance.prixCaptrans,
      'dateVigueurCaptrans': instance.dateVigueurCaptrans.toIso8601String(),
      'enCours': instance.enCours,
      'nomGie': instance.nomGie,
      'prixSupplementaire': instance.prixSupplementaire,
      'commentaire': instance.commentaire,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
    };
