// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cotisation_success.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CotisationSuccess _$$_CotisationSuccessFromJson(Map<String, dynamic> json) =>
    _$_CotisationSuccess(
      bus: Bus.fromJson(json['bus'] as Map<String, dynamic>),
      cotisation:
          Cotisation.fromJson(json['cotisation'] as Map<String, dynamic>),
      cotisationAuto: json['cotisation_auto'] == null
          ? null
          : Cotisation.fromJson(
              json['cotisation_auto'] as Map<String, dynamic>),
      lastCotisation: json['last_cotisation'] == null
          ? null
          : CotisationResume.fromJson(
              json['last_cotisation'] as Map<String, dynamic>),
      montantEncaisser: json['montant_encaisser'] as int?,
    );

Map<String, dynamic> _$$_CotisationSuccessToJson(
        _$_CotisationSuccess instance) =>
    <String, dynamic>{
      'bus': instance.bus,
      'cotisation': instance.cotisation,
      'cotisation_auto': instance.cotisationAuto,
      'last_cotisation': instance.lastCotisation,
      'montant_encaisser': instance.montantEncaisser,
    };
