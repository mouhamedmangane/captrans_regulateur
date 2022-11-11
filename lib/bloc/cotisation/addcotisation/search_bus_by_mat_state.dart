part of "search_bus_by_mat_bloc.dart";


enum SearchBusByMatStatus {loading,failureRequest,failureTreatement,success}

class SearchBusByMatState extends Equatable{
  final SearchBusByMatStatus status;
  final String matricule;
  final String message;
  final Bus ? bus;
  const SearchBusByMatState({
    this.status = SearchBusByMatStatus.loading,
    this.matricule='',
    this.message='',
    this.bus=null,
  });

  SearchBusByMatState copyWith({
    SearchBusByMatStatus ? status,
    String ? matricule,
    String ? message,
    Bus? bus,
  }){
    return SearchBusByMatState(
      status: status ?? this.status,
      message: message ?? this.message,
      matricule: matricule ?? this.matricule,
      bus: bus ?? this.bus,
    );
  }

  @override
  List<Object?> get props => [status,matricule,message];
}
