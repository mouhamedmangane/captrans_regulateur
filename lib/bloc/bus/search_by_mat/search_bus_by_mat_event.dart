
part of 'search_bus_by_mat_bloc.dart';

abstract class SearchBusByMatEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchBusByMatCharger extends SearchBusByMatEvent{
  final String matricule;
  SearchBusByMatCharger(this.matricule);

  @override
  List<Object?> get props => [matricule];
}
class SearchBusByMatFailled extends SearchBusByMatEvent{
  final String message;
  final bool hasConnexion;
  SearchBusByMatFailled(this.message, {this.hasConnexion = false});

  @override
  List<Object?> get props => [message,hasConnexion];
}
class SearchBusByMatScanner extends SearchBusByMatEvent{}
