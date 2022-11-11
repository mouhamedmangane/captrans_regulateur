// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cotisation_save.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CotisationSave _$CotisationSaveFromJson(Map<String, dynamic> json) {
  return _CotisationSave.fromJson(json);
}

/// @nodoc
mixin _$CotisationSave {
  int get regulateurId => throw _privateConstructorUsedError;
  int get receveurId => throw _privateConstructorUsedError;
  int get busId => throw _privateConstructorUsedError;
  int get montant => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CotisationSaveCopyWith<CotisationSave> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CotisationSaveCopyWith<$Res> {
  factory $CotisationSaveCopyWith(
          CotisationSave value, $Res Function(CotisationSave) then) =
      _$CotisationSaveCopyWithImpl<$Res, CotisationSave>;
  @useResult
  $Res call({int regulateurId, int receveurId, int busId, int montant});
}

/// @nodoc
class _$CotisationSaveCopyWithImpl<$Res, $Val extends CotisationSave>
    implements $CotisationSaveCopyWith<$Res> {
  _$CotisationSaveCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regulateurId = null,
    Object? receveurId = null,
    Object? busId = null,
    Object? montant = null,
  }) {
    return _then(_value.copyWith(
      regulateurId: null == regulateurId
          ? _value.regulateurId
          : regulateurId // ignore: cast_nullable_to_non_nullable
              as int,
      receveurId: null == receveurId
          ? _value.receveurId
          : receveurId // ignore: cast_nullable_to_non_nullable
              as int,
      busId: null == busId
          ? _value.busId
          : busId // ignore: cast_nullable_to_non_nullable
              as int,
      montant: null == montant
          ? _value.montant
          : montant // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CotisationSaveCopyWith<$Res>
    implements $CotisationSaveCopyWith<$Res> {
  factory _$$_CotisationSaveCopyWith(
          _$_CotisationSave value, $Res Function(_$_CotisationSave) then) =
      __$$_CotisationSaveCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int regulateurId, int receveurId, int busId, int montant});
}

/// @nodoc
class __$$_CotisationSaveCopyWithImpl<$Res>
    extends _$CotisationSaveCopyWithImpl<$Res, _$_CotisationSave>
    implements _$$_CotisationSaveCopyWith<$Res> {
  __$$_CotisationSaveCopyWithImpl(
      _$_CotisationSave _value, $Res Function(_$_CotisationSave) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? regulateurId = null,
    Object? receveurId = null,
    Object? busId = null,
    Object? montant = null,
  }) {
    return _then(_$_CotisationSave(
      regulateurId: null == regulateurId
          ? _value.regulateurId
          : regulateurId // ignore: cast_nullable_to_non_nullable
              as int,
      receveurId: null == receveurId
          ? _value.receveurId
          : receveurId // ignore: cast_nullable_to_non_nullable
              as int,
      busId: null == busId
          ? _value.busId
          : busId // ignore: cast_nullable_to_non_nullable
              as int,
      montant: null == montant
          ? _value.montant
          : montant // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CotisationSave implements _CotisationSave {
  const _$_CotisationSave(
      {required this.regulateurId,
      required this.receveurId,
      required this.busId,
      required this.montant});

  factory _$_CotisationSave.fromJson(Map<String, dynamic> json) =>
      _$$_CotisationSaveFromJson(json);

  @override
  final int regulateurId;
  @override
  final int receveurId;
  @override
  final int busId;
  @override
  final int montant;

  @override
  String toString() {
    return 'CotisationSave(regulateurId: $regulateurId, receveurId: $receveurId, busId: $busId, montant: $montant)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CotisationSave &&
            (identical(other.regulateurId, regulateurId) ||
                other.regulateurId == regulateurId) &&
            (identical(other.receveurId, receveurId) ||
                other.receveurId == receveurId) &&
            (identical(other.busId, busId) || other.busId == busId) &&
            (identical(other.montant, montant) || other.montant == montant));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, regulateurId, receveurId, busId, montant);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CotisationSaveCopyWith<_$_CotisationSave> get copyWith =>
      __$$_CotisationSaveCopyWithImpl<_$_CotisationSave>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CotisationSaveToJson(
      this,
    );
  }
}

abstract class _CotisationSave implements CotisationSave {
  const factory _CotisationSave(
      {required final int regulateurId,
      required final int receveurId,
      required final int busId,
      required final int montant}) = _$_CotisationSave;

  factory _CotisationSave.fromJson(Map<String, dynamic> json) =
      _$_CotisationSave.fromJson;

  @override
  int get regulateurId;
  @override
  int get receveurId;
  @override
  int get busId;
  @override
  int get montant;
  @override
  @JsonKey(ignore: true)
  _$$_CotisationSaveCopyWith<_$_CotisationSave> get copyWith =>
      throw _privateConstructorUsedError;
}
