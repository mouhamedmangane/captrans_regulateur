// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bus.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Bus _$BusFromJson(Map<String, dynamic> json) {
  return _Bus.fromJson(json);
}

/// @nodoc
mixin _$Bus {
  int get id => throw _privateConstructorUsedError;
  int get compte => throw _privateConstructorUsedError;
  String get matricule => throw _privateConstructorUsedError;
  int get proprietaireId => throw _privateConstructorUsedError;
  int get numeroLigne => throw _privateConstructorUsedError;
  String? get marque => throw _privateConstructorUsedError;
  DateTime? get lastDateCotisation => throw _privateConstructorUsedError;
  DateTime? get created_at => throw _privateConstructorUsedError;
  DateTime? get updated_at => throw _privateConstructorUsedError;
  int? get jourEtat => throw _privateConstructorUsedError;
  int? get montantEtat => throw _privateConstructorUsedError;
  String? get nomGie => throw _privateConstructorUsedError;
  Proprietaire? get proprietaire => throw _privateConstructorUsedError;
  List<Receveur>? get receveurs => throw _privateConstructorUsedError;
  List<EtatBus>? get etatBus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BusCopyWith<Bus> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusCopyWith<$Res> {
  factory $BusCopyWith(Bus value, $Res Function(Bus) then) =
      _$BusCopyWithImpl<$Res, Bus>;
  @useResult
  $Res call(
      {int id,
      int compte,
      String matricule,
      int proprietaireId,
      int numeroLigne,
      String? marque,
      DateTime? lastDateCotisation,
      DateTime? created_at,
      DateTime? updated_at,
      int? jourEtat,
      int? montantEtat,
      String? nomGie,
      Proprietaire? proprietaire,
      List<Receveur>? receveurs,
      List<EtatBus>? etatBus});

  $ProprietaireCopyWith<$Res>? get proprietaire;
}

/// @nodoc
class _$BusCopyWithImpl<$Res, $Val extends Bus> implements $BusCopyWith<$Res> {
  _$BusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? compte = null,
    Object? matricule = null,
    Object? proprietaireId = null,
    Object? numeroLigne = null,
    Object? marque = freezed,
    Object? lastDateCotisation = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
    Object? jourEtat = freezed,
    Object? montantEtat = freezed,
    Object? nomGie = freezed,
    Object? proprietaire = freezed,
    Object? receveurs = freezed,
    Object? etatBus = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      compte: null == compte
          ? _value.compte
          : compte // ignore: cast_nullable_to_non_nullable
              as int,
      matricule: null == matricule
          ? _value.matricule
          : matricule // ignore: cast_nullable_to_non_nullable
              as String,
      proprietaireId: null == proprietaireId
          ? _value.proprietaireId
          : proprietaireId // ignore: cast_nullable_to_non_nullable
              as int,
      numeroLigne: null == numeroLigne
          ? _value.numeroLigne
          : numeroLigne // ignore: cast_nullable_to_non_nullable
              as int,
      marque: freezed == marque
          ? _value.marque
          : marque // ignore: cast_nullable_to_non_nullable
              as String?,
      lastDateCotisation: freezed == lastDateCotisation
          ? _value.lastDateCotisation
          : lastDateCotisation // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      jourEtat: freezed == jourEtat
          ? _value.jourEtat
          : jourEtat // ignore: cast_nullable_to_non_nullable
              as int?,
      montantEtat: freezed == montantEtat
          ? _value.montantEtat
          : montantEtat // ignore: cast_nullable_to_non_nullable
              as int?,
      nomGie: freezed == nomGie
          ? _value.nomGie
          : nomGie // ignore: cast_nullable_to_non_nullable
              as String?,
      proprietaire: freezed == proprietaire
          ? _value.proprietaire
          : proprietaire // ignore: cast_nullable_to_non_nullable
              as Proprietaire?,
      receveurs: freezed == receveurs
          ? _value.receveurs
          : receveurs // ignore: cast_nullable_to_non_nullable
              as List<Receveur>?,
      etatBus: freezed == etatBus
          ? _value.etatBus
          : etatBus // ignore: cast_nullable_to_non_nullable
              as List<EtatBus>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProprietaireCopyWith<$Res>? get proprietaire {
    if (_value.proprietaire == null) {
      return null;
    }

    return $ProprietaireCopyWith<$Res>(_value.proprietaire!, (value) {
      return _then(_value.copyWith(proprietaire: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BusCopyWith<$Res> implements $BusCopyWith<$Res> {
  factory _$$_BusCopyWith(_$_Bus value, $Res Function(_$_Bus) then) =
      __$$_BusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int compte,
      String matricule,
      int proprietaireId,
      int numeroLigne,
      String? marque,
      DateTime? lastDateCotisation,
      DateTime? created_at,
      DateTime? updated_at,
      int? jourEtat,
      int? montantEtat,
      String? nomGie,
      Proprietaire? proprietaire,
      List<Receveur>? receveurs,
      List<EtatBus>? etatBus});

  @override
  $ProprietaireCopyWith<$Res>? get proprietaire;
}

/// @nodoc
class __$$_BusCopyWithImpl<$Res> extends _$BusCopyWithImpl<$Res, _$_Bus>
    implements _$$_BusCopyWith<$Res> {
  __$$_BusCopyWithImpl(_$_Bus _value, $Res Function(_$_Bus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? compte = null,
    Object? matricule = null,
    Object? proprietaireId = null,
    Object? numeroLigne = null,
    Object? marque = freezed,
    Object? lastDateCotisation = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
    Object? jourEtat = freezed,
    Object? montantEtat = freezed,
    Object? nomGie = freezed,
    Object? proprietaire = freezed,
    Object? receveurs = freezed,
    Object? etatBus = freezed,
  }) {
    return _then(_$_Bus(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      compte: null == compte
          ? _value.compte
          : compte // ignore: cast_nullable_to_non_nullable
              as int,
      matricule: null == matricule
          ? _value.matricule
          : matricule // ignore: cast_nullable_to_non_nullable
              as String,
      proprietaireId: null == proprietaireId
          ? _value.proprietaireId
          : proprietaireId // ignore: cast_nullable_to_non_nullable
              as int,
      numeroLigne: null == numeroLigne
          ? _value.numeroLigne
          : numeroLigne // ignore: cast_nullable_to_non_nullable
              as int,
      marque: freezed == marque
          ? _value.marque
          : marque // ignore: cast_nullable_to_non_nullable
              as String?,
      lastDateCotisation: freezed == lastDateCotisation
          ? _value.lastDateCotisation
          : lastDateCotisation // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      jourEtat: freezed == jourEtat
          ? _value.jourEtat
          : jourEtat // ignore: cast_nullable_to_non_nullable
              as int?,
      montantEtat: freezed == montantEtat
          ? _value.montantEtat
          : montantEtat // ignore: cast_nullable_to_non_nullable
              as int?,
      nomGie: freezed == nomGie
          ? _value.nomGie
          : nomGie // ignore: cast_nullable_to_non_nullable
              as String?,
      proprietaire: freezed == proprietaire
          ? _value.proprietaire
          : proprietaire // ignore: cast_nullable_to_non_nullable
              as Proprietaire?,
      receveurs: freezed == receveurs
          ? _value._receveurs
          : receveurs // ignore: cast_nullable_to_non_nullable
              as List<Receveur>?,
      etatBus: freezed == etatBus
          ? _value._etatBus
          : etatBus // ignore: cast_nullable_to_non_nullable
              as List<EtatBus>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Bus with DiagnosticableTreeMixin implements _Bus {
  const _$_Bus(
      {required this.id,
      required this.compte,
      required this.matricule,
      required this.proprietaireId,
      required this.numeroLigne,
      this.marque,
      this.lastDateCotisation,
      this.created_at,
      this.updated_at,
      this.jourEtat,
      this.montantEtat,
      this.nomGie,
      this.proprietaire,
      final List<Receveur>? receveurs,
      final List<EtatBus>? etatBus})
      : _receveurs = receveurs,
        _etatBus = etatBus;

  factory _$_Bus.fromJson(Map<String, dynamic> json) => _$$_BusFromJson(json);

  @override
  final int id;
  @override
  final int compte;
  @override
  final String matricule;
  @override
  final int proprietaireId;
  @override
  final int numeroLigne;
  @override
  final String? marque;
  @override
  final DateTime? lastDateCotisation;
  @override
  final DateTime? created_at;
  @override
  final DateTime? updated_at;
  @override
  final int? jourEtat;
  @override
  final int? montantEtat;
  @override
  final String? nomGie;
  @override
  final Proprietaire? proprietaire;
  final List<Receveur>? _receveurs;
  @override
  List<Receveur>? get receveurs {
    final value = _receveurs;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<EtatBus>? _etatBus;
  @override
  List<EtatBus>? get etatBus {
    final value = _etatBus;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Bus(id: $id, compte: $compte, matricule: $matricule, proprietaireId: $proprietaireId, numeroLigne: $numeroLigne, marque: $marque, lastDateCotisation: $lastDateCotisation, created_at: $created_at, updated_at: $updated_at, jourEtat: $jourEtat, montantEtat: $montantEtat, nomGie: $nomGie, proprietaire: $proprietaire, receveurs: $receveurs, etatBus: $etatBus)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Bus'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('compte', compte))
      ..add(DiagnosticsProperty('matricule', matricule))
      ..add(DiagnosticsProperty('proprietaireId', proprietaireId))
      ..add(DiagnosticsProperty('numeroLigne', numeroLigne))
      ..add(DiagnosticsProperty('marque', marque))
      ..add(DiagnosticsProperty('lastDateCotisation', lastDateCotisation))
      ..add(DiagnosticsProperty('created_at', created_at))
      ..add(DiagnosticsProperty('updated_at', updated_at))
      ..add(DiagnosticsProperty('jourEtat', jourEtat))
      ..add(DiagnosticsProperty('montantEtat', montantEtat))
      ..add(DiagnosticsProperty('nomGie', nomGie))
      ..add(DiagnosticsProperty('proprietaire', proprietaire))
      ..add(DiagnosticsProperty('receveurs', receveurs))
      ..add(DiagnosticsProperty('etatBus', etatBus));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Bus &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.compte, compte) || other.compte == compte) &&
            (identical(other.matricule, matricule) ||
                other.matricule == matricule) &&
            (identical(other.proprietaireId, proprietaireId) ||
                other.proprietaireId == proprietaireId) &&
            (identical(other.numeroLigne, numeroLigne) ||
                other.numeroLigne == numeroLigne) &&
            (identical(other.marque, marque) || other.marque == marque) &&
            (identical(other.lastDateCotisation, lastDateCotisation) ||
                other.lastDateCotisation == lastDateCotisation) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.updated_at, updated_at) ||
                other.updated_at == updated_at) &&
            (identical(other.jourEtat, jourEtat) ||
                other.jourEtat == jourEtat) &&
            (identical(other.montantEtat, montantEtat) ||
                other.montantEtat == montantEtat) &&
            (identical(other.nomGie, nomGie) || other.nomGie == nomGie) &&
            (identical(other.proprietaire, proprietaire) ||
                other.proprietaire == proprietaire) &&
            const DeepCollectionEquality()
                .equals(other._receveurs, _receveurs) &&
            const DeepCollectionEquality().equals(other._etatBus, _etatBus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      compte,
      matricule,
      proprietaireId,
      numeroLigne,
      marque,
      lastDateCotisation,
      created_at,
      updated_at,
      jourEtat,
      montantEtat,
      nomGie,
      proprietaire,
      const DeepCollectionEquality().hash(_receveurs),
      const DeepCollectionEquality().hash(_etatBus));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BusCopyWith<_$_Bus> get copyWith =>
      __$$_BusCopyWithImpl<_$_Bus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BusToJson(
      this,
    );
  }
}

abstract class _Bus implements Bus {
  const factory _Bus(
      {required final int id,
      required final int compte,
      required final String matricule,
      required final int proprietaireId,
      required final int numeroLigne,
      final String? marque,
      final DateTime? lastDateCotisation,
      final DateTime? created_at,
      final DateTime? updated_at,
      final int? jourEtat,
      final int? montantEtat,
      final String? nomGie,
      final Proprietaire? proprietaire,
      final List<Receveur>? receveurs,
      final List<EtatBus>? etatBus}) = _$_Bus;

  factory _Bus.fromJson(Map<String, dynamic> json) = _$_Bus.fromJson;

  @override
  int get id;
  @override
  int get compte;
  @override
  String get matricule;
  @override
  int get proprietaireId;
  @override
  int get numeroLigne;
  @override
  String? get marque;
  @override
  DateTime? get lastDateCotisation;
  @override
  DateTime? get created_at;
  @override
  DateTime? get updated_at;
  @override
  int? get jourEtat;
  @override
  int? get montantEtat;
  @override
  String? get nomGie;
  @override
  Proprietaire? get proprietaire;
  @override
  List<Receveur>? get receveurs;
  @override
  List<EtatBus>? get etatBus;
  @override
  @JsonKey(ignore: true)
  _$$_BusCopyWith<_$_Bus> get copyWith => throw _privateConstructorUsedError;
}
