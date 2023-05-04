

part of 'bus_search_bloc.dart';

enum BusSearchStatus {init,loading,error,done,loadingAdd,errorAdd}

class BusSearchState extends Equatable{
  final BusSearchStatus status;
  final ListPaginate<Bus> buss;
  final String ? search;
  final String ? message;
  BusSearchState({
    BusSearchStatus ? status,
    ListPaginate<Bus> ?buss,
    int ? page,
    int ? maxPage,
    String ? search,
    String ?message,
  }):
  status=status ?? BusSearchStatus.init,
  buss=buss??ListPaginate(),
  search=search ?? '',
  message = message ?? ''
  ;


  BusSearchState copyWith({
    BusSearchStatus ? status,
    ListPaginate<Bus> ?buss,
    String ? search,
    String ?message,
})=> BusSearchState(
      status: status ?? this.status,
     buss:buss ?? this.buss,
      search : search ?? this.search,
      message : message ?? this.message
  );


  @override
  // TODO: implement props
  List<Object?> get props => [buss,status,message];
}