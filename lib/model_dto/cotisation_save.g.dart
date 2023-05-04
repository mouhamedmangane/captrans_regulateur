// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cotisation_save.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CotisationSave _$$_CotisationSaveFromJson(Map<String, dynamic> json) =>
    _$_CotisationSave(
      userId: json['user_id'] as int,
      receveurId: json['receveur_id'] as int,
      receveurTel: json['receveur_tel'] as String,
      receveurNom: json['receveur_nom'] as String,
      busId: json['bus_id'] as int,
      montant: json['montant'] as int,
    );

Map<String, dynamic> _$$_CotisationSaveToJson(_$_CotisationSave instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'receveur_id': instance.receveurId,
      'receveur_tel': instance.receveurTel,
      'receveur_nom': instance.receveurNom,
      'bus_id': instance.busId,
      'montant': instance.montant,
    };
