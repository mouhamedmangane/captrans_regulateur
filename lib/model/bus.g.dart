// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Bus _$$_BusFromJson(Map<String, dynamic> json) => _$_Bus(
      id: json['id'] as int,
      compte: json['compte'] as int?,
      matricule: json['matricule'] as String,
      proprietaireId: json['proprietaire_id'] as int?,
      numeroLigne: json['numero_ligne'] as String,
      marque: json['marque'] as String?,
      lastDateCotisation: json['last_date_cotisation'] == null
          ? null
          : DateTime.parse(json['last_date_cotisation'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      dateEnVigueur: json['date_en_vigueur'] == null
          ? null
          : DateTime.parse(json['date_en_vigueur'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      jourEtat: json['jour_etat'] as int?,
      montantEtat: json['montant_etat'] as int?,
      nomGie: json['nom_gie'] as String?,
      proprietaire: json['proprietaire'] == null
          ? null
          : Proprietaire.fromJson(json['proprietaire'] as Map<String, dynamic>),
      receveurs: (json['receveurs'] as List<dynamic>?)
          ?.map((e) => Receveur.fromJson(e as Map<String, dynamic>))
          .toList(),
      etatBus: (json['etat_bus'] as List<dynamic>?)
          ?.map((e) => EtatBus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BusToJson(_$_Bus instance) => <String, dynamic>{
      'id': instance.id,
      'compte': instance.compte,
      'matricule': instance.matricule,
      'proprietaire_id': instance.proprietaireId,
      'numero_ligne': instance.numeroLigne,
      'marque': instance.marque,
      'last_date_cotisation': instance.lastDateCotisation?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'date_en_vigueur': instance.dateEnVigueur?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'jour_etat': instance.jourEtat,
      'montant_etat': instance.montantEtat,
      'nom_gie': instance.nomGie,
      'proprietaire': instance.proprietaire,
      'receveurs': instance.receveurs,
      'etat_bus': instance.etatBus,
    };
