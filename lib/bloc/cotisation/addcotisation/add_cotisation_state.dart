part of "add_cotisation_bloc.dart";

enum AddCotisationStatus {initial,loading,success,failure}

class AddCotisationState extends Equatable{
  AddCotisationStatus status;
  Bus ? bus;
  Receveur ? receveur;
  int ? montant;
  String ? message;
  Cotisation  ? cotisation;

  AddCotisationState({
    this.status=AddCotisationStatus.initial,
    this.bus=null,
    this.receveur=null,
    this.montant=0,
    this.message='',
    this.cotisation=null,
  });

  AddCotisationState copyWith({
    AddCotisationStatus ? status,
    Bus ? bus,
    Receveur ? receveur,
    int ? montant,
    String ? message,
    Cotisation ? cotisation,
  }){
    return AddCotisationState(
        status: status ?? this.status,
        bus: bus ?? this.bus,
        receveur: receveur ?? this.receveur,
        montant: montant ?? this.montant,
        message: message?? this.message,
        cotisation:cotisation,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
