// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'receveur.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Receveur _$ReceveurFromJson(Map<String, dynamic> json) {
  return _Receveur.fromJson(json);
}

/// @nodoc
mixin _$Receveur {
  int get id => throw _privateConstructorUsedError;
  String get nom => throw _privateConstructorUsedError;
  String get tel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReceveurCopyWith<Receveur> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceveurCopyWith<$Res> {
  factory $ReceveurCopyWith(Receveur value, $Res Function(Receveur) then) =
      _$ReceveurCopyWithImpl<$Res, Receveur>;
  @useResult
  $Res call({int id, String nom, String tel});
}

/// @nodoc
class _$ReceveurCopyWithImpl<$Res, $Val extends Receveur>
    implements $ReceveurCopyWith<$Res> {
  _$ReceveurCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nom = null,
    Object? tel = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      tel: null == tel
          ? _value.tel
          : tel // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReceveurCopyWith<$Res> implements $ReceveurCopyWith<$Res> {
  factory _$$_ReceveurCopyWith(
          _$_Receveur value, $Res Function(_$_Receveur) then) =
      __$$_ReceveurCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String nom, String tel});
}

/// @nodoc
class __$$_ReceveurCopyWithImpl<$Res>
    extends _$ReceveurCopyWithImpl<$Res, _$_Receveur>
    implements _$$_ReceveurCopyWith<$Res> {
  __$$_ReceveurCopyWithImpl(
      _$_Receveur _value, $Res Function(_$_Receveur) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nom = null,
    Object? tel = null,
  }) {
    return _then(_$_Receveur(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nom: null == nom
          ? _value.nom
          : nom // ignore: cast_nullable_to_non_nullable
              as String,
      tel: null == tel
          ? _value.tel
          : tel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Receveur implements _Receveur {
  const _$_Receveur({required this.id, required this.nom, required this.tel});

  factory _$_Receveur.fromJson(Map<String, dynamic> json) =>
      _$$_ReceveurFromJson(json);

  @override
  final int id;
  @override
  final String nom;
  @override
  final String tel;

  @override
  String toString() {
    return 'Receveur(id: $id, nom: $nom, tel: $tel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Receveur &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nom, nom) || other.nom == nom) &&
            (identical(other.tel, tel) || other.tel == tel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, nom, tel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReceveurCopyWith<_$_Receveur> get copyWith =>
      __$$_ReceveurCopyWithImpl<_$_Receveur>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReceveurToJson(
      this,
    );
  }
}

abstract class _Receveur implements Receveur {
  const factory _Receveur(
      {required final int id,
      required final String nom,
      required final String tel}) = _$_Receveur;

  factory _Receveur.fromJson(Map<String, dynamic> json) = _$_Receveur.fromJson;

  @override
  int get id;
  @override
  String get nom;
  @override
  String get tel;
  @override
  @JsonKey(ignore: true)
  _$$_ReceveurCopyWith<_$_Receveur> get copyWith =>
      throw _privateConstructorUsedError;
}
