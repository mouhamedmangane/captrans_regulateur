// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'collect.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Collect _$CollectFromJson(Map<String, dynamic> json) {
  return _Collect.fromJson(json);
}

/// @nodoc
mixin _$Collect {
  int get id => throw _privateConstructorUsedError;
  int get montant => throw _privateConstructorUsedError;
  int get collecteurId => throw _privateConstructorUsedError;
  int get regulateurId => throw _privateConstructorUsedError;
  DateTime? get created_at => throw _privateConstructorUsedError;
  DateTime? get updated_at => throw _privateConstructorUsedError;
  User? get collecteur => throw _privateConstructorUsedError;
  User? get regulateur => throw _privateConstructorUsedError;
  List<Cotisation>? get cotisations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CollectCopyWith<Collect> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectCopyWith<$Res> {
  factory $CollectCopyWith(Collect value, $Res Function(Collect) then) =
      _$CollectCopyWithImpl<$Res, Collect>;
  @useResult
  $Res call(
      {int id,
      int montant,
      int collecteurId,
      int regulateurId,
      DateTime? created_at,
      DateTime? updated_at,
      User? collecteur,
      User? regulateur,
      List<Cotisation>? cotisations});

  $UserCopyWith<$Res>? get collecteur;
  $UserCopyWith<$Res>? get regulateur;
}

/// @nodoc
class _$CollectCopyWithImpl<$Res, $Val extends Collect>
    implements $CollectCopyWith<$Res> {
  _$CollectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? montant = null,
    Object? collecteurId = null,
    Object? regulateurId = null,
    Object? created_at = freezed,
    Object? updated_at = freezed,
    Object? collecteur = freezed,
    Object? regulateur = freezed,
    Object? cotisations = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      montant: null == montant
          ? _value.montant
          : montant // ignore: cast_nullable_to_non_nullable
              as int,
      collecteurId: null == collecteurId
          ? _value.collecteurId
          : collecteurId // ignore: cast_nullable_to_non_nullable
              as int,
      regulateurId: null == regulateurId
          ? _value.regulateurId
          : regulateurId // ignore: cast_nullable_to_non_nullable
              as int,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      collecteur: freezed == collecteur
          ? _value.collecteur
          : collecteur // ignore: cast_nullable_to_non_nullable
              as User?,
      regulateur: freezed == regulateur
          ? _value.regulateur
          : regulateur // ignore: cast_nullable_to_non_nullable
              as User?,
      cotisations: freezed == cotisations
          ? _value.cotisations
          : cotisations // ignore: cast_nullable_to_non_nullable
              as List<Cotisation>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get collecteur {
    if (_value.collecteur == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.collecteur!, (value) {
      return _then(_value.copyWith(collecteur: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get regulateur {
    if (_value.regulateur == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.regulateur!, (value) {
      return _then(_value.copyWith(regulateur: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CollectCopyWith<$Res> implements $CollectCopyWith<$Res> {
  factory _$$_CollectCopyWith(
          _$_Collect value, $Res Function(_$_Collect) then) =
      __$$_CollectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int montant,
      int collecteurId,
      int regulateurId,
      DateTime? created_at,
      DateTime? updated_at,
      User? collecteur,
      User? regulateur,
      List<Cotisation>? cotisations});

  @override
  $UserCopyWith<$Res>? get collecteur;
  @override
  $UserCopyWith<$Res>? get regulateur;
}

/// @nodoc
class __$$_CollectCopyWithImpl<$Res>
    extends _$CollectCopyWithImpl<$Res, _$_Collect>
    implements _$$_CollectCopyWith<$Res> {
  __$$_CollectCopyWithImpl(_$_Collect _value, $Res Function(_$_Collect) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? montant = null,
    Object? collecteurId = null,
    Object? regulateurId = null,
    Object? created_at = freezed,
    Object? updated_at = freezed,
    Object? collecteur = freezed,
    Object? regulateur = freezed,
    Object? cotisations = freezed,
  }) {
    return _then(_$_Collect(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      montant: null == montant
          ? _value.montant
          : montant // ignore: cast_nullable_to_non_nullable
              as int,
      collecteurId: null == collecteurId
          ? _value.collecteurId
          : collecteurId // ignore: cast_nullable_to_non_nullable
              as int,
      regulateurId: null == regulateurId
          ? _value.regulateurId
          : regulateurId // ignore: cast_nullable_to_non_nullable
              as int,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      collecteur: freezed == collecteur
          ? _value.collecteur
          : collecteur // ignore: cast_nullable_to_non_nullable
              as User?,
      regulateur: freezed == regulateur
          ? _value.regulateur
          : regulateur // ignore: cast_nullable_to_non_nullable
              as User?,
      cotisations: freezed == cotisations
          ? _value._cotisations
          : cotisations // ignore: cast_nullable_to_non_nullable
              as List<Cotisation>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Collect with DiagnosticableTreeMixin implements _Collect {
  const _$_Collect(
      {required this.id,
      required this.montant,
      required this.collecteurId,
      required this.regulateurId,
      this.created_at,
      this.updated_at,
      this.collecteur,
      this.regulateur,
      final List<Cotisation>? cotisations})
      : _cotisations = cotisations;

  factory _$_Collect.fromJson(Map<String, dynamic> json) =>
      _$$_CollectFromJson(json);

  @override
  final int id;
  @override
  final int montant;
  @override
  final int collecteurId;
  @override
  final int regulateurId;
  @override
  final DateTime? created_at;
  @override
  final DateTime? updated_at;
  @override
  final User? collecteur;
  @override
  final User? regulateur;
  final List<Cotisation>? _cotisations;
  @override
  List<Cotisation>? get cotisations {
    final value = _cotisations;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Collect(id: $id, montant: $montant, collecteurId: $collecteurId, regulateurId: $regulateurId, created_at: $created_at, updated_at: $updated_at, collecteur: $collecteur, regulateur: $regulateur, cotisations: $cotisations)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Collect'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('montant', montant))
      ..add(DiagnosticsProperty('collecteurId', collecteurId))
      ..add(DiagnosticsProperty('regulateurId', regulateurId))
      ..add(DiagnosticsProperty('created_at', created_at))
      ..add(DiagnosticsProperty('updated_at', updated_at))
      ..add(DiagnosticsProperty('collecteur', collecteur))
      ..add(DiagnosticsProperty('regulateur', regulateur))
      ..add(DiagnosticsProperty('cotisations', cotisations));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Collect &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.montant, montant) || other.montant == montant) &&
            (identical(other.collecteurId, collecteurId) ||
                other.collecteurId == collecteurId) &&
            (identical(other.regulateurId, regulateurId) ||
                other.regulateurId == regulateurId) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.updated_at, updated_at) ||
                other.updated_at == updated_at) &&
            (identical(other.collecteur, collecteur) ||
                other.collecteur == collecteur) &&
            (identical(other.regulateur, regulateur) ||
                other.regulateur == regulateur) &&
            const DeepCollectionEquality()
                .equals(other._cotisations, _cotisations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      montant,
      collecteurId,
      regulateurId,
      created_at,
      updated_at,
      collecteur,
      regulateur,
      const DeepCollectionEquality().hash(_cotisations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CollectCopyWith<_$_Collect> get copyWith =>
      __$$_CollectCopyWithImpl<_$_Collect>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CollectToJson(
      this,
    );
  }
}

abstract class _Collect implements Collect {
  const factory _Collect(
      {required final int id,
      required final int montant,
      required final int collecteurId,
      required final int regulateurId,
      final DateTime? created_at,
      final DateTime? updated_at,
      final User? collecteur,
      final User? regulateur,
      final List<Cotisation>? cotisations}) = _$_Collect;

  factory _Collect.fromJson(Map<String, dynamic> json) = _$_Collect.fromJson;

  @override
  int get id;
  @override
  int get montant;
  @override
  int get collecteurId;
  @override
  int get regulateurId;
  @override
  DateTime? get created_at;
  @override
  DateTime? get updated_at;
  @override
  User? get collecteur;
  @override
  User? get regulateur;
  @override
  List<Cotisation>? get cotisations;
  @override
  @JsonKey(ignore: true)
  _$$_CollectCopyWith<_$_Collect> get copyWith =>
      throw _privateConstructorUsedError;
}
