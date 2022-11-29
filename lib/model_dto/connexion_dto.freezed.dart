// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'connexion_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConnexionDto _$ConnexionDtoFromJson(Map<String, dynamic> json) {
  return _ConnexionDto.fromJson(json);
}

/// @nodoc
mixin _$ConnexionDto {
  String get login => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConnexionDtoCopyWith<ConnexionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnexionDtoCopyWith<$Res> {
  factory $ConnexionDtoCopyWith(
          ConnexionDto value, $Res Function(ConnexionDto) then) =
      _$ConnexionDtoCopyWithImpl<$Res, ConnexionDto>;
  @useResult
  $Res call({String login, String password});
}

/// @nodoc
class _$ConnexionDtoCopyWithImpl<$Res, $Val extends ConnexionDto>
    implements $ConnexionDtoCopyWith<$Res> {
  _$ConnexionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConnexionDtoCopyWith<$Res>
    implements $ConnexionDtoCopyWith<$Res> {
  factory _$$_ConnexionDtoCopyWith(
          _$_ConnexionDto value, $Res Function(_$_ConnexionDto) then) =
      __$$_ConnexionDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String login, String password});
}

/// @nodoc
class __$$_ConnexionDtoCopyWithImpl<$Res>
    extends _$ConnexionDtoCopyWithImpl<$Res, _$_ConnexionDto>
    implements _$$_ConnexionDtoCopyWith<$Res> {
  __$$_ConnexionDtoCopyWithImpl(
      _$_ConnexionDto _value, $Res Function(_$_ConnexionDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = null,
    Object? password = null,
  }) {
    return _then(_$_ConnexionDto(
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ConnexionDto implements _ConnexionDto {
  const _$_ConnexionDto({required this.login, required this.password});

  factory _$_ConnexionDto.fromJson(Map<String, dynamic> json) =>
      _$$_ConnexionDtoFromJson(json);

  @override
  final String login;
  @override
  final String password;

  @override
  String toString() {
    return 'ConnexionDto(login: $login, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConnexionDto &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, login, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConnexionDtoCopyWith<_$_ConnexionDto> get copyWith =>
      __$$_ConnexionDtoCopyWithImpl<_$_ConnexionDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConnexionDtoToJson(
      this,
    );
  }
}

abstract class _ConnexionDto implements ConnexionDto {
  const factory _ConnexionDto(
      {required final String login,
      required final String password}) = _$_ConnexionDto;

  factory _ConnexionDto.fromJson(Map<String, dynamic> json) =
      _$_ConnexionDto.fromJson;

  @override
  String get login;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_ConnexionDtoCopyWith<_$_ConnexionDto> get copyWith =>
      throw _privateConstructorUsedError;
}
