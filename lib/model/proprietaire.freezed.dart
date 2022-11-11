// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'proprietaire.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Proprietaire _$ProprietaireFromJson(Map<String, dynamic> json) {
  return _Proprietaire.fromJson(json);
}

/// @nodoc
mixin _$Proprietaire {
  int get id => throw _privateConstructorUsedError;
  String get nom => throw _privateConstructorUsedError;
  String get tel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProprietaireCopyWith<Proprietaire> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProprietaireCopyWith<$Res> {
  factory $ProprietaireCopyWith(
          Proprietaire value, $Res Function(Proprietaire) then) =
      _$ProprietaireCopyWithImpl<$Res, Proprietaire>;
  @useResult
  $Res call({int id, String nom, String tel});
}

/// @nodoc
class _$ProprietaireCopyWithImpl<$Res, $Val extends Proprietaire>
    implements $ProprietaireCopyWith<$Res> {
  _$ProprietaireCopyWithImpl(this._value, this._then);

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
abstract class _$$_ProprietaireCopyWith<$Res>
    implements $ProprietaireCopyWith<$Res> {
  factory _$$_ProprietaireCopyWith(
          _$_Proprietaire value, $Res Function(_$_Proprietaire) then) =
      __$$_ProprietaireCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String nom, String tel});
}

/// @nodoc
class __$$_ProprietaireCopyWithImpl<$Res>
    extends _$ProprietaireCopyWithImpl<$Res, _$_Proprietaire>
    implements _$$_ProprietaireCopyWith<$Res> {
  __$$_ProprietaireCopyWithImpl(
      _$_Proprietaire _value, $Res Function(_$_Proprietaire) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nom = null,
    Object? tel = null,
  }) {
    return _then(_$_Proprietaire(
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
class _$_Proprietaire with DiagnosticableTreeMixin implements _Proprietaire {
  const _$_Proprietaire(
      {required this.id, required this.nom, required this.tel});

  factory _$_Proprietaire.fromJson(Map<String, dynamic> json) =>
      _$$_ProprietaireFromJson(json);

  @override
  final int id;
  @override
  final String nom;
  @override
  final String tel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Proprietaire(id: $id, nom: $nom, tel: $tel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Proprietaire'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('nom', nom))
      ..add(DiagnosticsProperty('tel', tel));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Proprietaire &&
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
  _$$_ProprietaireCopyWith<_$_Proprietaire> get copyWith =>
      __$$_ProprietaireCopyWithImpl<_$_Proprietaire>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProprietaireToJson(
      this,
    );
  }
}

abstract class _Proprietaire implements Proprietaire {
  const factory _Proprietaire(
      {required final int id,
      required final String nom,
      required final String tel}) = _$_Proprietaire;

  factory _Proprietaire.fromJson(Map<String, dynamic> json) =
      _$_Proprietaire.fromJson;

  @override
  int get id;
  @override
  String get nom;
  @override
  String get tel;
  @override
  @JsonKey(ignore: true)
  _$$_ProprietaireCopyWith<_$_Proprietaire> get copyWith =>
      throw _privateConstructorUsedError;
}
