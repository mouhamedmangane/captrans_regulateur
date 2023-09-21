// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cotisation_success_with_montant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CotisationSuccessWithMoantant _$CotisationSuccessWithMoantantFromJson(
    Map<String, dynamic> json) {
  return _CotisationSuccessWithMoantant.fromJson(json);
}

/// @nodoc
mixin _$CotisationSuccessWithMoantant {
  CotisationSuccess get ticket => throw _privateConstructorUsedError;
  int get montantEncaisser => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CotisationSuccessWithMoantantCopyWith<CotisationSuccessWithMoantant>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CotisationSuccessWithMoantantCopyWith<$Res> {
  factory $CotisationSuccessWithMoantantCopyWith(
          CotisationSuccessWithMoantant value,
          $Res Function(CotisationSuccessWithMoantant) then) =
      _$CotisationSuccessWithMoantantCopyWithImpl<$Res,
          CotisationSuccessWithMoantant>;
  @useResult
  $Res call({CotisationSuccess ticket, int montantEncaisser});

  $CotisationSuccessCopyWith<$Res> get ticket;
}

/// @nodoc
class _$CotisationSuccessWithMoantantCopyWithImpl<$Res,
        $Val extends CotisationSuccessWithMoantant>
    implements $CotisationSuccessWithMoantantCopyWith<$Res> {
  _$CotisationSuccessWithMoantantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticket = null,
    Object? montantEncaisser = null,
  }) {
    return _then(_value.copyWith(
      ticket: null == ticket
          ? _value.ticket
          : ticket // ignore: cast_nullable_to_non_nullable
              as CotisationSuccess,
      montantEncaisser: null == montantEncaisser
          ? _value.montantEncaisser
          : montantEncaisser // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CotisationSuccessCopyWith<$Res> get ticket {
    return $CotisationSuccessCopyWith<$Res>(_value.ticket, (value) {
      return _then(_value.copyWith(ticket: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CotisationSuccessWithMoantantCopyWith<$Res>
    implements $CotisationSuccessWithMoantantCopyWith<$Res> {
  factory _$$_CotisationSuccessWithMoantantCopyWith(
          _$_CotisationSuccessWithMoantant value,
          $Res Function(_$_CotisationSuccessWithMoantant) then) =
      __$$_CotisationSuccessWithMoantantCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CotisationSuccess ticket, int montantEncaisser});

  @override
  $CotisationSuccessCopyWith<$Res> get ticket;
}

/// @nodoc
class __$$_CotisationSuccessWithMoantantCopyWithImpl<$Res>
    extends _$CotisationSuccessWithMoantantCopyWithImpl<$Res,
        _$_CotisationSuccessWithMoantant>
    implements _$$_CotisationSuccessWithMoantantCopyWith<$Res> {
  __$$_CotisationSuccessWithMoantantCopyWithImpl(
      _$_CotisationSuccessWithMoantant _value,
      $Res Function(_$_CotisationSuccessWithMoantant) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticket = null,
    Object? montantEncaisser = null,
  }) {
    return _then(_$_CotisationSuccessWithMoantant(
      ticket: null == ticket
          ? _value.ticket
          : ticket // ignore: cast_nullable_to_non_nullable
              as CotisationSuccess,
      montantEncaisser: null == montantEncaisser
          ? _value.montantEncaisser
          : montantEncaisser // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CotisationSuccessWithMoantant
    implements _CotisationSuccessWithMoantant {
  const _$_CotisationSuccessWithMoantant(
      {required this.ticket, required this.montantEncaisser});

  factory _$_CotisationSuccessWithMoantant.fromJson(
          Map<String, dynamic> json) =>
      _$$_CotisationSuccessWithMoantantFromJson(json);

  @override
  final CotisationSuccess ticket;
  @override
  final int montantEncaisser;

  @override
  String toString() {
    return 'CotisationSuccessWithMoantant(ticket: $ticket, montantEncaisser: $montantEncaisser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CotisationSuccessWithMoantant &&
            (identical(other.ticket, ticket) || other.ticket == ticket) &&
            (identical(other.montantEncaisser, montantEncaisser) ||
                other.montantEncaisser == montantEncaisser));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, ticket, montantEncaisser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CotisationSuccessWithMoantantCopyWith<_$_CotisationSuccessWithMoantant>
      get copyWith => __$$_CotisationSuccessWithMoantantCopyWithImpl<
          _$_CotisationSuccessWithMoantant>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CotisationSuccessWithMoantantToJson(
      this,
    );
  }
}

abstract class _CotisationSuccessWithMoantant
    implements CotisationSuccessWithMoantant {
  const factory _CotisationSuccessWithMoantant(
      {required final CotisationSuccess ticket,
      required final int montantEncaisser}) = _$_CotisationSuccessWithMoantant;

  factory _CotisationSuccessWithMoantant.fromJson(Map<String, dynamic> json) =
      _$_CotisationSuccessWithMoantant.fromJson;

  @override
  CotisationSuccess get ticket;
  @override
  int get montantEncaisser;
  @override
  @JsonKey(ignore: true)
  _$$_CotisationSuccessWithMoantantCopyWith<_$_CotisationSuccessWithMoantant>
      get copyWith => throw _privateConstructorUsedError;
}
