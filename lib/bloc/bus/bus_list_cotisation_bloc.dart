import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/cotisation.dart';
import '../../repository/bus/bus_repo.dart';

class BusListCotisationBloc extends Bloc<BusListCotisationEvent,BusListCotisationState>{
  BusRepo _busRepo;
  BusListCotisationBloc(BusRepo busRepo):
  _busRepo=busRepo,
  super(BusListCotisationState()){
    on<BusListCotisationLoad>(load);
    on<BusListCotisationNewData>(newData);
  }

  Future<void> load(BusListCotisationLoad event,Emitter<BusListCotisationState> emit) async{

  }

  Future<void> newData(BusListCotisationNewData event,Emitter<BusListCotisationState> emit) async{

  }


}

class BusListCotisationEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class BusListCotisationLoad extends BusListCotisationEvent{
  String search;
  List<Cotisation> cotisations;
  BusListCotisationLoad({required  this.search, required this.cotisations});
  List<Object?> get props => [search,cotisations];
}

class BusListCotisationNewData extends BusListCotisationEvent{
  List<Cotisation> cotisations;
  BusListCotisationNewData(this.cotisations);
  List<Object?> get props => [cotisations];
}

enum BusListCotisationStatus{init,loading,error,done,loadingAdd,errorAdd}

class BusListCotisationState extends Equatable{
  BusListCotisationStatus status;
  List<Cotisation> cotisations;
  int  page;
  int maxPage;
  String ? search;
  String ? message;

  BusListCotisationState({
    BusListCotisationStatus ? status,
    List<Cotisation> ? cotisations,
    int ? page,
    int ? maxPage,
    String ? search,
    String ?message,
  }):
    status=status ?? BusListCotisationStatus.init,
    cotisations=cotisations??[],
    page=page ?? 0,
    maxPage =maxPage ?? 0,
    search=search ?? '',
    message = message ?? ''
  ;

  BusListCotisationState copyWith({
    BusListCotisationStatus ? status,
    List<Cotisation> ? cotisations,
    int ? page,
    int ? maxPage,
    String ? search,
    String ?message,
  }) => BusListCotisationState(
    status: status ?? this.status,
    cotisations: cotisations ?? this.cotisations,
    page: page ?? this.page,
    maxPage: maxPage ?? this.maxPage,
    search : search ?? this.search,
    message : message ?? this.message
  );

  List<Object?> get props => [status,cotisations,maxPage,page,search,message];

}
