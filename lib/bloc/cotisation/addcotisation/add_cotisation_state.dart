part of "add_cotisation_bloc.dart";

enum AddCotisationStatus {initial,loading,success,failure}

class AddCotisationState extends Equatable{

  final AddCotisationStatus status;
  final Bus ? bus;
  final Receveur ? receveur;
  final int ? montant;
  final String ? message;
  final CotisationSuccessWithMoantant  ? cotisation;


  const AddCotisationState({
    this.status=AddCotisationStatus.initial,
    this.bus ,
    this.receveur ,
    this.montant=0,
    this.message='',
    this.cotisation,
  });

  AddCotisationState copyWith({
    AddCotisationStatus ? status,
    Bus ? bus,
    Receveur ? receveur,
    int ? montant,
    String ? message,
    CotisationSuccessWithMoantant ? cotisation,
  }){
    return AddCotisationState(
        status: status ?? this.status,
        bus: bus ?? this.bus,
        receveur: receveur ?? this.receveur,
        montant: montant ?? this.montant,
        message: message?? this.message,
        cotisation:cotisation ?? this.cotisation,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status,bus,receveur,montant,message,cotisation];
}
