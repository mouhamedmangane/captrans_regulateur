

part of 'receveur_search_bloc.dart';

enum ReceveurSearchStatus {loading,done,error}

class ReceveurSearchState extends Equatable{
  ReceveurSearchStatus status;
  List<Receveur>  receveurs=[];
  int ? page;
  String ? search;
  String ? message;
  ReceveurSearchState({
    ReceveurSearchStatus ? status,
    List<Receveur> ? receveurs,
    int ? page,
    String ? search,
    String ?message,
  }):
  status=status ?? ReceveurSearchStatus.loading,
  receveurs=receveurs??[],
  page=page ?? 0,
  search=search ?? '',
  message = message ?? ''
  ;



  @override
  // TODO: implement props
  List<Object?> get props => [receveurs,status];
}