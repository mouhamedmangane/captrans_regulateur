import 'package:captrans_regulateur/app_const.dart';
import 'package:captrans_regulateur/model/collect.dart';
import 'package:captrans_regulateur/model/cotisation.dart';
import 'package:captrans_regulateur/repository/collect/collect_repo.dart';
import 'package:captrans_regulateur/repository/cotisation/cotisation_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/dto/list_paginate.dart';
import 'package:noppal_util/repository/npl_treat_request_exception.dart';

class CollectDetailBloc extends Bloc<CollectDetailEvent,CollectDetailState>{
  final CotisationRepo _cotisationRepo;

  int aa=0;
  CollectDetailBloc({
    required CollectRepo collectRepo,
    required CotisationRepo cotisationRepo}):
    _cotisationRepo=cotisationRepo,
      super(CollectDetailState()){
    on<CollectDetailLoad>(_load);
    on<CollectDetailNextPage>(_next);
  }

  Future<void>_load(CollectDetailLoad event,Emitter<CollectDetailState> emit)async{
    emit(state.copyWith(status: CollectDetailStatus.loading,collect: event.collect));
    await _cotisationRepo.findByCollectId(event.collect.id,page:1).then((value){
      emit(state.copyWith(status: CollectDetailStatus.success,cotisations: value));
    }).catchError((error){
        String message;
        if(error is NplTreatRequestException) {
          message = error.message;
        } else {
          message = AppConst.noConnexion;
        }
        emit(state.copyWith(status: CollectDetailStatus.error,message: message));


    });
  }

  Future<void> _next(CollectDetailNextPage event,Emitter<CollectDetailState> emit) async{
    emit(state.copyWith(status: CollectDetailStatus.loadingAdd));
    await _cotisationRepo.findByCollectId(state.collect!.id,page:state.cotisations.currentPage+1).then((value){
      state.cotisations.addPage(value);
      emit(state.copyWith(status: CollectDetailStatus.success));
    }).catchError((error){
      String message;
      if(error is NplTreatRequestException) {
        message = error.message;
      } else {
        message = AppConst.noConnexion;
      }
      emit(state.copyWith(status: CollectDetailStatus.errorAdd,message: message));

    });
  }


}

class CollectDetailEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CollectDetailLoad extends CollectDetailEvent{
  final Collect collect;
  CollectDetailLoad(this.collect);

  @override
  List<Object?> get props => [collect];
}
class CollectDetailNextPage extends CollectDetailEvent{}




enum CollectDetailStatus{init,loading,error,success,errorAdd,loadingAdd}
class CollectDetailState extends Equatable{
  final ListPaginate<Cotisation> cotisations;
  final CollectDetailStatus status;
  final String message;
  final Collect ?  collect;

  CollectDetailState({
    this.collect,
    ListPaginate<Cotisation> ? cotisations,
    CollectDetailStatus ? status,
    String ? message,
  }):
    cotisations=cotisations ?? ListPaginate(),
   status  =status ?? CollectDetailStatus.init,
   message= message ?? '';

  CollectDetailState copyWith({
    Collect ?collect,
    ListPaginate<Cotisation>  ?cotisations,
    CollectDetailStatus ? status,
    String ? message,
  })=>CollectDetailState(
    collect: collect ?? this.collect,
    cotisations: cotisations ?? this.cotisations,
    status:  status ?? this.status,
    message: message ?? this.message,
  );


  @override
  // TODO: implement props
  List<Object?> get props => [cotisations,status,message];
}
