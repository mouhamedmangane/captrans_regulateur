// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int,
      name: json['name'] as String,
      adresse: json['adresse'] as String?,
      login: json['login'] as String?,
      token: json['token'] as String?,
      code: json['code'] as String?,
      tel: json['tel'] as String?,
      email: json['email'] as String?,
      profil: json['profil'] as String?,
      cni: json['cni'] as String?,
      fonction: json['fonction'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'adresse': instance.adresse,
      'login': instance.login,
      'token': instance.token,
      'code': instance.code,
      'tel': instance.tel,
      'email': instance.email,
      'profil': instance.profil,
      'cni': instance.cni,
      'fonction': instance.fonction,
    };
