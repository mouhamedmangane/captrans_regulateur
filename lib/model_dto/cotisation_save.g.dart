// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cotisation_save.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CotisationSave _$$_CotisationSaveFromJson(Map<String, dynamic> json) =>
    _$_CotisationSave(
      regulateurId: json['regulateurId'] as int,
      receveurId: json['receveurId'] as int,
      busId: json['busId'] as int,
      montant: json['montant'] as int,
    );

Map<String, dynamic> _$$_CotisationSaveToJson(_$_CotisationSave instance) =>
    <String, dynamic>{
      'regulateurId': instance.regulateurId,
      'receveurId': instance.receveurId,
      'busId': instance.busId,
      'montant': instance.montant,
    };
