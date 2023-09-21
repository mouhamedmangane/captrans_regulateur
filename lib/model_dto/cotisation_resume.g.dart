// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cotisation_resume.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CotisationResume _$$_CotisationResumeFromJson(Map<String, dynamic> json) =>
    _$_CotisationResume(
      montantVerser: (json['montant_verser'] as num).toDouble(),
      jourEtat: json['jour_etat'] as int,
      montantEtat: json['montant_etat'] as int,
      compte: (json['compte'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$_CotisationResumeToJson(_$_CotisationResume instance) =>
    <String, dynamic>{
      'montant_verser': instance.montantVerser,
      'jour_etat': instance.jourEtat,
      'montant_etat': instance.montantEtat,
      'compte': instance.compte,
      'date': instance.date.toIso8601String(),
    };
