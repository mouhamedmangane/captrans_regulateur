// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cotisation_resume.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CotisationResume _$CotisationResumeFromJson(Map<String, dynamic> json) {
  return _CotisationResume.fromJson(json);
}

/// @nodoc
mixin _$CotisationResume {
  double get montantVerser => throw _privateConstructorUsedError;
  int get jourEtat => throw _privateConstructorUsedError;
  int get montantEtat => throw _privateConstructorUsedError;
  double get compte => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CotisationResumeCopyWith<CotisationResume> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CotisationResumeCopyWith<$Res> {
  factory $CotisationResumeCopyWith(
          CotisationResume value, $Res Function(CotisationResume) then) =
      _$CotisationResumeCopyWithImpl<$Res, CotisationResume>;
  @useResult
  $Res call(
      {double montantVerser,
      int jourEtat,
      int montantEtat,
      double compte,
      DateTime date});
}

/// @nodoc
class _$CotisationResumeCopyWithImpl<$Res, $Val extends CotisationResume>
    implements $CotisationResumeCopyWith<$Res> {
  _$CotisationResumeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? montantVerser = null,
    Object? jourEtat = null,
    Object? montantEtat = null,
    Object? compte = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      montantVerser: null == montantVerser
          ? _value.montantVerser
          : montantVerser // ignore: cast_nullable_to_non_nullable
              as double,
      jourEtat: null == jourEtat
          ? _value.jourEtat
          : jourEtat // ignore: cast_nullable_to_non_nullable
              as int,
      montantEtat: null == montantEtat
          ? _value.montantEtat
          : montantEtat // ignore: cast_nullable_to_non_nullable
              as int,
      compte: null == compte
          ? _value.compte
          : compte // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CotisationResumeCopyWith<$Res>
    implements $CotisationResumeCopyWith<$Res> {
  factory _$$_CotisationResumeCopyWith(
          _$_CotisationResume value, $Res Function(_$_CotisationResume) then) =
      __$$_CotisationResumeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double montantVerser,
      int jourEtat,
      int montantEtat,
      double compte,
      DateTime date});
}

/// @nodoc
class __$$_CotisationResumeCopyWithImpl<$Res>
    extends _$CotisationResumeCopyWithImpl<$Res, _$_CotisationResume>
    implements _$$_CotisationResumeCopyWith<$Res> {
  __$$_CotisationResumeCopyWithImpl(
      _$_CotisationResume _value, $Res Function(_$_CotisationResume) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? montantVerser = null,
    Object? jourEtat = null,
    Object? montantEtat = null,
    Object? compte = null,
    Object? date = null,
  }) {
    return _then(_$_CotisationResume(
      montantVerser: null == montantVerser
          ? _value.montantVerser
          : montantVerser // ignore: cast_nullable_to_non_nullable
              as double,
      jourEtat: null == jourEtat
          ? _value.jourEtat
          : jourEtat // ignore: cast_nullable_to_non_nullable
              as int,
      montantEtat: null == montantEtat
          ? _value.montantEtat
          : montantEtat // ignore: cast_nullable_to_non_nullable
              as int,
      compte: null == compte
          ? _value.compte
          : compte // ignore: cast_nullable_to_non_nullable
              as double,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CotisationResume implements _CotisationResume {
  const _$_CotisationResume(
      {required this.montantVerser,
      required this.jourEtat,
      required this.montantEtat,
      required this.compte,
      required this.date});

  factory _$_CotisationResume.fromJson(Map<String, dynamic> json) =>
      _$$_CotisationResumeFromJson(json);

  @override
  final double montantVerser;
  @override
  final int jourEtat;
  @override
  final int montantEtat;
  @override
  final double compte;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'CotisationResume(montantVerser: $montantVerser, jourEtat: $jourEtat, montantEtat: $montantEtat, compte: $compte, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CotisationResume &&
            (identical(other.montantVerser, montantVerser) ||
                other.montantVerser == montantVerser) &&
            (identical(other.jourEtat, jourEtat) ||
                other.jourEtat == jourEtat) &&
            (identical(other.montantEtat, montantEtat) ||
                other.montantEtat == montantEtat) &&
            (identical(other.compte, compte) || other.compte == compte) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, montantVerser, jourEtat, montantEtat, compte, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CotisationResumeCopyWith<_$_CotisationResume> get copyWith =>
      __$$_CotisationResumeCopyWithImpl<_$_CotisationResume>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CotisationResumeToJson(
      this,
    );
  }
}

abstract class _CotisationResume implements CotisationResume {
  const factory _CotisationResume(
      {required final double montantVerser,
      required final int jourEtat,
      required final int montantEtat,
      required final double compte,
      required final DateTime date}) = _$_CotisationResume;

  factory _CotisationResume.fromJson(Map<String, dynamic> json) =
      _$_CotisationResume.fromJson;

  @override
  double get montantVerser;
  @override
  int get jourEtat;
  @override
  int get montantEtat;
  @override
  double get compte;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$_CotisationResumeCopyWith<_$_CotisationResume> get copyWith =>
      throw _privateConstructorUsedError;
}
