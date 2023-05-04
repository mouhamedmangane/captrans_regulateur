// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'etat_bus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EtatBus _$$_EtatBusFromJson(Map<String, dynamic> json) => _$_EtatBus(
      id: json['id'] as int,
      prixSpecialCaptrans: json['prix_special_captrans'] as int,
      prixSpecialGie: json['prix_special_gie'] as int,
      prixGie: json['prix_gie'] as int,
      dateVigueurGie: DateTime.parse(json['date_vigueur_gie'] as String),
      prixCaptrans: json['prix_captrans'] as int,
      dateVigueurCaptrans:
          DateTime.parse(json['date_vigueur_captrans'] as String),
      enCours: json['en_cours'] as bool?,
      nomGie: json['nom_gie'] as String,
      prixSupplementaire: json['prix_supplementaire'] as int?,
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
      'prix_special_captrans': instance.prixSpecialCaptrans,
      'prix_special_gie': instance.prixSpecialGie,
      'prix_gie': instance.prixGie,
      'date_vigueur_gie': instance.dateVigueurGie.toIso8601String(),
      'prix_captrans': instance.prixCaptrans,
      'date_vigueur_captrans': instance.dateVigueurCaptrans.toIso8601String(),
      'en_cours': instance.enCours,
      'nom_gie': instance.nomGie,
      'prix_supplementaire': instance.prixSupplementaire,
      'commentaire': instance.commentaire,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
    };
