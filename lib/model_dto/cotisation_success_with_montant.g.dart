// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cotisation_success_with_montant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CotisationSuccessWithMoantant _$$_CotisationSuccessWithMoantantFromJson(
        Map<String, dynamic> json) =>
    _$_CotisationSuccessWithMoantant(
      ticket:
          CotisationSuccess.fromJson(json['ticket'] as Map<String, dynamic>),
      montantEncaisser: json['montant_encaisser'] as int,
    );

Map<String, dynamic> _$$_CotisationSuccessWithMoantantToJson(
        _$_CotisationSuccessWithMoantant instance) =>
    <String, dynamic>{
      'ticket': instance.ticket,
      'montant_encaisser': instance.montantEncaisser,
    };
