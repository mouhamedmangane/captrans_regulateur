

part of 'bus_search_bloc.dart';

enum BusSearchStatus {init,loading,error,done,loadingAdd,errorAdd}

class BusSearchState extends Equatable{
  BusSearchStatus status;
  List<Bus> buss=[];
  int  page;
  int maxPage;
  String ? search;
  String ? message;
  BusSearchState({
    BusSearchStatus ? status,
    List<Bus> ?buss,
    int ? page,
    int ? maxPage,
    String ? search,
    String ?message,
  }):
  status=status ?? BusSearchStatus.init,
  buss=buss??[],
  page=page ?? 0,
  maxPage =maxPage ?? 0,
  search=search ?? '',
  message = message ?? ''
  ;


  BusSearchState copyWith({
    BusSearchStatus ? status,
    List<Bus> ?buss,
    int ? page,
    int ? maxPage,
    String ? search,
    String ?message,
})=> BusSearchState(
      status: status ?? this.status,
     buss:buss ?? this.buss,
      page:  page ?? this.page,
      maxPage: maxPage  ?? this.maxPage,
      search : search ?? this.search,
      message : message ?? this.message
  );


  @override
  // TODO: implement props
  List<Object?> get props => [buss,status,page,maxPage,message];
}