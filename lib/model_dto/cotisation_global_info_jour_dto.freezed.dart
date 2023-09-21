// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cotisation_global_info_jour_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CotisationGlobalInfoJour _$CotisationGlobalInfoJourFromJson(
    Map<String, dynamic> json) {
  return _CotisationGlobalInfoJour.fromJson(json);
}

/// @nodoc
mixin _$CotisationGlobalInfoJour {
  DateTime get jour => throw _privateConstructorUsedError;
  double get montant => throw _privateConstructorUsedError;
  int get nombre => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CotisationGlobalInfoJourCopyWith<CotisationGlobalInfoJour> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CotisationGlobalInfoJourCopyWith<$Res> {
  factory $CotisationGlobalInfoJourCopyWith(CotisationGlobalInfoJour value,
          $Res Function(CotisationGlobalInfoJour) then) =
      _$CotisationGlobalInfoJourCopyWithImpl<$Res, CotisationGlobalInfoJour>;
  @useResult
  $Res call({DateTime jour, double montant, int nombre});
}

/// @nodoc
class _$CotisationGlobalInfoJourCopyWithImpl<$Res,
        $Val extends CotisationGlobalInfoJour>
    implements $CotisationGlobalInfoJourCopyWith<$Res> {
  _$CotisationGlobalInfoJourCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jour = null,
    Object? montant = null,
    Object? nombre = null,
  }) {
    return _then(_value.copyWith(
      jour: null == jour
          ? _value.jour
          : jour // ignore: cast_nullable_to_non_nullable
              as DateTime,
      montant: null == montant
          ? _value.montant
          : montant // ignore: cast_nullable_to_non_nullable
              as double,
      nombre: null == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CotisationGlobalInfoJourCopyWith<$Res>
    implements $CotisationGlobalInfoJourCopyWith<$Res> {
  factory _$$_CotisationGlobalInfoJourCopyWith(
          _$_CotisationGlobalInfoJour value,
          $Res Function(_$_CotisationGlobalInfoJour) then) =
      __$$_CotisationGlobalInfoJourCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime jour, double montant, int nombre});
}

/// @nodoc
class __$$_CotisationGlobalInfoJourCopyWithImpl<$Res>
    extends _$CotisationGlobalInfoJourCopyWithImpl<$Res,
        _$_CotisationGlobalInfoJour>
    implements _$$_CotisationGlobalInfoJourCopyWith<$Res> {
  __$$_CotisationGlobalInfoJourCopyWithImpl(_$_CotisationGlobalInfoJour _value,
      $Res Function(_$_CotisationGlobalInfoJour) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jour = null,
    Object? montant = null,
    Object? nombre = null,
  }) {
    return _then(_$_CotisationGlobalInfoJour(
      jour: null == jour
          ? _value.jour
          : jour // ignore: cast_nullable_to_non_nullable
              as DateTime,
      montant: null == montant
          ? _value.montant
          : montant // ignore: cast_nullable_to_non_nullable
              as double,
      nombre: null == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CotisationGlobalInfoJour implements _CotisationGlobalInfoJour {
  const _$_CotisationGlobalInfoJour(
      {required this.jour, required this.montant, required this.nombre});

  factory _$_CotisationGlobalInfoJour.fromJson(Map<String, dynamic> json) =>
      _$$_CotisationGlobalInfoJourFromJson(json);

  @override
  final DateTime jour;
  @override
  final double montant;
  @override
  final int nombre;

  @override
  String toString() {
    return 'CotisationGlobalInfoJour(jour: $jour, montant: $montant, nombre: $nombre)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CotisationGlobalInfoJour &&
            (identical(other.jour, jour) || other.jour == jour) &&
            (identical(other.montant, montant) || other.montant == montant) &&
            (identical(other.nombre, nombre) || other.nombre == nombre));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, jour, montant, nombre);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CotisationGlobalInfoJourCopyWith<_$_CotisationGlobalInfoJour>
      get copyWith => __$$_CotisationGlobalInfoJourCopyWithImpl<
          _$_CotisationGlobalInfoJour>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CotisationGlobalInfoJourToJson(
      this,
    );
  }
}

abstract class _CotisationGlobalInfoJour implements CotisationGlobalInfoJour {
  const factory _CotisationGlobalInfoJour(
      {required final DateTime jour,
      required final double montant,
      required final int nombre}) = _$_CotisationGlobalInfoJour;

  factory _CotisationGlobalInfoJour.fromJson(Map<String, dynamic> json) =
      _$_CotisationGlobalInfoJour.fromJson;

  @override
  DateTime get jour;
  @override
  double get montant;
  @override
  int get nombre;
  @override
  @JsonKey(ignore: true)
  _$$_CotisationGlobalInfoJourCopyWith<_$_CotisationGlobalInfoJour>
      get copyWith => throw _privateConstructorUsedError;
}
