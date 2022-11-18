

part of 'receveur_search_bloc.dart';

enum ReceveurSearchStatus {init,loading,error,done,loadingAdd,errorAdd}

class ReceveurSearchState extends Equatable{
  ReceveurSearchStatus status;
  List<Receveur>  receveurs=[];
  int  page;
  int maxPage;
  String ? search;
  String ? message;
  ReceveurSearchState({
    ReceveurSearchStatus ? status,
    List<Receveur> ? receveurs,
    int ? page,
    int ? maxPage,
    String ? search,
    String ?message,
  }):
  status=status ?? ReceveurSearchStatus.init,
  receveurs=receveurs??[],
  page=page ?? 0,
  maxPage =maxPage ?? 0,
  search=search ?? '',
  message = message ?? ''
  ;


  ReceveurSearchState copyWith({
    ReceveurSearchStatus ? status,
    List<Receveur> ? receveurs,
    int ? page,
    int ? maxPage,
    String ? search,
    String ?message,
})=> ReceveurSearchState(
      status: status ?? this.status,
      receveurs: receveurs ?? this.receveurs,
      page:  page ?? this.page,
      maxPage: maxPage  ?? this.maxPage,
      search : search ?? this.search,
      message : message ?? this.message
  );


  @override
  // TODO: implement props
  List<Object?> get props => [receveurs,status,page,maxPage,message];
}