
part of 'add_cotisation_bloc.dart';

class AddCotisationEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddCotisationSelectedBus extends AddCotisationEvent{
  final Bus bus;
  AddCotisationSelectedBus(this.bus);

  @override
  // TODO: implement props
  List<Object?> get props => [bus];
}

class AddCotisationSelectedReceveur extends AddCotisationEvent{
  final Receveur receveur;
  AddCotisationSelectedReceveur(this.receveur);

  @override
  // TODO: implement props
  List<Object?> get props => [receveur];
}

class AddCotisationValidation extends AddCotisationEvent{
  final int montant;
  AddCotisationValidation(this.montant);

  @override
  // TODO: implement props
  List<Object?> get props => [montant];
}




