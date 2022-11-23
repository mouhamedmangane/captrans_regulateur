
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connexion_dto.freezed.dart';
part 'connexion_dto.g.dart';

@Freezed()
class ConnexionDto with _$ConnexionDto {
  const factory ConnexionDto({
    required String login,
    required String password,
  }) = _ConnexionDto;

  factory ConnexionDto.fromJson(Map<String, dynamic> json) =>
      _$ConnexionDtoFromJson(json);
}