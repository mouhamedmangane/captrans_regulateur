
import 'package:freezed_annotation/freezed_annotation.dart';


part 'user.freezed.dart';

part 'user.g.dart';


@Freezed()
class User with _$User{
  const factory User({
    required int id,
    required String name,
    String ? adresse,
    String ? login,
    String ? token,
    String ? code,
    String ? tel,
    String ? email,
    String ? profil,
    String ? cni,
    String ? fonction,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
