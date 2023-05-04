// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cotisation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Cotisation _$CotisationFromJson(Map<String, dynamic> json) {
  return _Cotisation.fromJson(json);
}

/// @nodoc
mixin _$Cotisation {
  int get id => throw _privateConstructorUsedError;
  int get montant => throw _privateConstructorUsedError;
  int get montantCotiser => throw _privateConstructorUsedError;
  DateTime? get dateDebut => throw _privateConstructorUsedError;
  DateTime? get dateFin => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  int? get regulateurId => throw _privateConstructorUsedError;
  int? get receveurId => throw _privateConstructorUsedError;
  int? get busId => throw _privateConstructorUsedError;
  User? get regulateur => throw _privateConstructorUsedError;
  Bus? get bus => throw _privateConstructorUsedError;
  Receveur? get receveur => throw _privateConstructorUsedError;
  List<LigneCotisation>? get ligneCotisations =>
      throw _privateConstructorUsedError;
  int? get compte => throw _privateConstructorUsedError;
  int? get jourEtat => throw _privateConstructorUsedError;
  int? get montantEtat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CotisationCopyWith<Cotisation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CotisationCopyWith<$Res> {
  factory $CotisationCopyWith(
          Cotisation value, $Res Function(Cotisation) then) =
      _$CotisationCopyWithImpl<$Res, Cotisation>;
  @useResult
  $Res call(
      {int id,
      int montant,
      int montantCotiser,
      DateTime? dateDebut,
      DateTime? dateFin,
      DateTime? createdAt,
      DateTime? updatedAt,
      int? regulateurId,
      int? receveurId,
      int? busId,
      User? regulateur,
      Bus? bus,
      Receveur? receveur,
      List<LigneCotisation>? ligneCotisations,
      int? compte,
      int? jourEtat,
      int? montantEtat});

  $UserCopyWith<$Res>? get regulateur;
  $BusCopyWith<$Res>? get bus;
  $ReceveurCopyWith<$Res>? get receveur;
}

/// @nodoc
class _$CotisationCopyWithImpl<$Res, $Val extends Cotisation>
    implements $CotisationCopyWith<$Res> {
  _$CotisationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? montant = null,
    Object? montantCotiser = null,
    Object? dateDebut = freezed,
    Object? dateFin = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? regulateurId = freezed,
    Object? receveurId = freezed,
    Object? busId = freezed,
    Object? regulateur = freezed,
    Object? bus = freezed,
    Object? receveur = freezed,
    Object? ligneCotisations = freezed,
    Object? compte = freezed,
    Object? jourEtat = freezed,
    Object? montantEtat = freezed,
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
      montantCotiser: null == montantCotiser
          ? _value.montantCotiser
          : montantCotiser // ignore: cast_nullable_to_non_nullable
              as int,
      dateDebut: freezed == dateDebut
          ? _value.dateDebut
          : dateDebut // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateFin: freezed == dateFin
          ? _value.dateFin
          : dateFin // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      regulateurId: freezed == regulateurId
          ? _value.regulateurId
          : regulateurId // ignore: cast_nullable_to_non_nullable
              as int?,
      receveurId: freezed == receveurId
          ? _value.receveurId
          : receveurId // ignore: cast_nullable_to_non_nullable
              as int?,
      busId: freezed == busId
          ? _value.busId
          : busId // ignore: cast_nullable_to_non_nullable
              as int?,
      regulateur: freezed == regulateur
          ? _value.regulateur
          : regulateur // ignore: cast_nullable_to_non_nullable
              as User?,
      bus: freezed == bus
          ? _value.bus
          : bus // ignore: cast_nullable_to_non_nullable
              as Bus?,
      receveur: freezed == receveur
          ? _value.receveur
          : receveur // ignore: cast_nullable_to_non_nullable
              as Receveur?,
      ligneCotisations: freezed == ligneCotisations
          ? _value.ligneCotisations
          : ligneCotisations // ignore: cast_nullable_to_non_nullable
              as List<LigneCotisation>?,
      compte: freezed == compte
          ? _value.compte
          : compte // ignore: cast_nullable_to_non_nullable
              as int?,
      jourEtat: freezed == jourEtat
          ? _value.jourEtat
          : jourEtat // ignore: cast_nullable_to_non_nullable
              as int?,
      montantEtat: freezed == montantEtat
          ? _value.montantEtat
          : montantEtat // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
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

  @override
  @pragma('vm:prefer-inline')
  $BusCopyWith<$Res>? get bus {
    if (_value.bus == null) {
      return null;
    }

    return $BusCopyWith<$Res>(_value.bus!, (value) {
      return _then(_value.copyWith(bus: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReceveurCopyWith<$Res>? get receveur {
    if (_value.receveur == null) {
      return null;
    }

    return $ReceveurCopyWith<$Res>(_value.receveur!, (value) {
      return _then(_value.copyWith(receveur: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CotisationCopyWith<$Res>
    implements $CotisationCopyWith<$Res> {
  factory _$$_CotisationCopyWith(
          _$_Cotisation value, $Res Function(_$_Cotisation) then) =
      __$$_CotisationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int montant,
      int montantCotiser,
      DateTime? dateDebut,
      DateTime? dateFin,
      DateTime? createdAt,
      DateTime? updatedAt,
      int? regulateurId,
      int? receveurId,
      int? busId,
      User? regulateur,
      Bus? bus,
      Receveur? receveur,
      List<LigneCotisation>? ligneCotisations,
      int? compte,
      int? jourEtat,
      int? montantEtat});

  @override
  $UserCopyWith<$Res>? get regulateur;
  @override
  $BusCopyWith<$Res>? get bus;
  @override
  $ReceveurCopyWith<$Res>? get receveur;
}

/// @nodoc
class __$$_CotisationCopyWithImpl<$Res>
    extends _$CotisationCopyWithImpl<$Res, _$_Cotisation>
    implements _$$_CotisationCopyWith<$Res> {
  __$$_CotisationCopyWithImpl(
      _$_Cotisation _value, $Res Function(_$_Cotisation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? montant = null,
    Object? montantCotiser = null,
    Object? dateDebut = freezed,
    Object? dateFin = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? regulateurId = freezed,
    Object? receveurId = freezed,
    Object? busId = freezed,
    Object? regulateur = freezed,
    Object? bus = freezed,
    Object? receveur = freezed,
    Object? ligneCotisations = freezed,
    Object? compte = freezed,
    Object? jourEtat = freezed,
    Object? montantEtat = freezed,
  }) {
    return _then(_$_Cotisation(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      montant: null == montant
          ? _value.montant
          : montant // ignore: cast_nullable_to_non_nullable
              as int,
      montantCotiser: null == montantCotiser
          ? _value.montantCotiser
          : montantCotiser // ignore: cast_nullable_to_non_nullable
              as int,
      dateDebut: freezed == dateDebut
          ? _value.dateDebut
          : dateDebut // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateFin: freezed == dateFin
          ? _value.dateFin
          : dateFin // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      regulateurId: freezed == regulateurId
          ? _value.regulateurId
          : regulateurId // ignore: cast_nullable_to_non_nullable
              as int?,
      receveurId: freezed == receveurId
          ? _value.receveurId
          : receveurId // ignore: cast_nullable_to_non_nullable
              as int?,
      busId: freezed == busId
          ? _value.busId
          : busId // ignore: cast_nullable_to_non_nullable
              as int?,
      regulateur: freezed == regulateur
          ? _value.regulateur
          : regulateur // ignore: cast_nullable_to_non_nullable
              as User?,
      bus: freezed == bus
          ? _value.bus
          : bus // ignore: cast_nullable_to_non_nullable
              as Bus?,
      receveur: freezed == receveur
          ? _value.receveur
          : receveur // ignore: cast_nullable_to_non_nullable
              as Receveur?,
      ligneCotisations: freezed == ligneCotisations
          ? _value._ligneCotisations
          : ligneCotisations // ignore: cast_nullable_to_non_nullable
              as List<LigneCotisation>?,
      compte: freezed == compte
          ? _value.compte
          : compte // ignore: cast_nullable_to_non_nullable
              as int?,
      jourEtat: freezed == jourEtat
          ? _value.jourEtat
          : jourEtat // ignore: cast_nullable_to_non_nullable
              as int?,
      montantEtat: freezed == montantEtat
          ? _value.montantEtat
          : montantEtat // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Cotisation extends _Cotisation {
  const _$_Cotisation(
      {required this.id,
      required this.montant,
      required this.montantCotiser,
      this.dateDebut,
      this.dateFin,
      this.createdAt,
      this.updatedAt,
      this.regulateurId,
      this.receveurId,
      this.busId,
      this.regulateur,
      this.bus,
      this.receveur,
      final List<LigneCotisation>? ligneCotisations,
      this.compte,
      this.jourEtat,
      this.montantEtat})
      : _ligneCotisations = ligneCotisations,
        super._();

  factory _$_Cotisation.fromJson(Map<String, dynamic> json) =>
      _$$_CotisationFromJson(json);

  @override
  final int id;
  @override
  final int montant;
  @override
  final int montantCotiser;
  @override
  final DateTime? dateDebut;
  @override
  final DateTime? dateFin;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final int? regulateurId;
  @override
  final int? receveurId;
  @override
  final int? busId;
  @override
  final User? regulateur;
  @override
  final Bus? bus;
  @override
  final Receveur? receveur;
  final List<LigneCotisation>? _ligneCotisations;
  @override
  List<LigneCotisation>? get ligneCotisations {
    final value = _ligneCotisations;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? compte;
  @override
  final int? jourEtat;
  @override
  final int? montantEtat;

  @override
  String toString() {
    return 'Cotisation(id: $id, montant: $montant, montantCotiser: $montantCotiser, dateDebut: $dateDebut, dateFin: $dateFin, createdAt: $createdAt, updatedAt: $updatedAt, regulateurId: $regulateurId, receveurId: $receveurId, busId: $busId, regulateur: $regulateur, bus: $bus, receveur: $receveur, ligneCotisations: $ligneCotisations, compte: $compte, jourEtat: $jourEtat, montantEtat: $montantEtat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Cotisation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.montant, montant) || other.montant == montant) &&
            (identical(other.montantCotiser, montantCotiser) ||
                other.montantCotiser == montantCotiser) &&
            (identical(other.dateDebut, dateDebut) ||
                other.dateDebut == dateDebut) &&
            (identical(other.dateFin, dateFin) || other.dateFin == dateFin) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.regulateurId, regulateurId) ||
                other.regulateurId == regulateurId) &&
            (identical(other.receveurId, receveurId) ||
                other.receveurId == receveurId) &&
            (identical(other.busId, busId) || other.busId == busId) &&
            (identical(other.regulateur, regulateur) ||
                other.regulateur == regulateur) &&
            (identical(other.bus, bus) || other.bus == bus) &&
            (identical(other.receveur, receveur) ||
                other.receveur == receveur) &&
            const DeepCollectionEquality()
                .equals(other._ligneCotisations, _ligneCotisations) &&
            (identical(other.compte, compte) || other.compte == compte) &&
            (identical(other.jourEtat, jourEtat) ||
                other.jourEtat == jourEtat) &&
            (identical(other.montantEtat, montantEtat) ||
                other.montantEtat == montantEtat));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      montant,
      montantCotiser,
      dateDebut,
      dateFin,
      createdAt,
      updatedAt,
      regulateurId,
      receveurId,
      busId,
      regulateur,
      bus,
      receveur,
      const DeepCollectionEquality().hash(_ligneCotisations),
      compte,
      jourEtat,
      montantEtat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CotisationCopyWith<_$_Cotisation> get copyWith =>
      __$$_CotisationCopyWithImpl<_$_Cotisation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CotisationToJson(
      this,
    );
  }
}

abstract class _Cotisation extends Cotisation {
  const factory _Cotisation(
      {required final int id,
      required final int montant,
      required final int montantCotiser,
      final DateTime? dateDebut,
      final DateTime? dateFin,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final int? regulateurId,
      final int? receveurId,
      final int? busId,
      final User? regulateur,
      final Bus? bus,
      final Receveur? receveur,
      final List<LigneCotisation>? ligneCotisations,
      final int? compte,
      final int? jourEtat,
      final int? montantEtat}) = _$_Cotisation;
  const _Cotisation._() : super._();

  factory _Cotisation.fromJson(Map<String, dynamic> json) =
      _$_Cotisation.fromJson;

  @override
  int get id;
  @override
  int get montant;
  @override
  int get montantCotiser;
  @override
  DateTime? get dateDebut;
  @override
  DateTime? get dateFin;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  int? get regulateurId;
  @override
  int? get receveurId;
  @override
  int? get busId;
  @override
  User? get regulateur;
  @override
  Bus? get bus;
  @override
  Receveur? get receveur;
  @override
  List<LigneCotisation>? get ligneCotisations;
  @override
  int? get compte;
  @override
  int? get jourEtat;
  @override
  int? get montantEtat;
  @override
  @JsonKey(ignore: true)
  _$$_CotisationCopyWith<_$_Cotisation> get copyWith =>
      throw _privateConstructorUsedError;
}
