
part of 'search_bus_by_mat_bloc.dart';

abstract class SearchBusByMatEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchBusByMatCharger extends SearchBusByMatEvent{
  String matricule;
  SearchBusByMatCharger(this.matricule);
  List<Object?> get props => [matricule];
}
class SearchBusByMatFailled extends SearchBusByMatEvent{
  String message;
  bool hasConnexion;
  SearchBusByMatFailled(this.message, {this.hasConnexion = false});
  List<Object?> get props => [message,hasConnexion];
}
class SearchBusByMatScanner extends SearchBusByMatEvent{}
