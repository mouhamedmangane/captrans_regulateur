import 'package:captrans_regulateur/app_const.dart';
import 'package:captrans_regulateur/model/collect.dart';
import 'package:captrans_regulateur/model/cotisation.dart';
import 'package:captrans_regulateur/modelDataTest/cotisation_data.dart';
import 'package:captrans_regulateur/repository/collect/collect_repo.dart';
import 'package:captrans_regulateur/repository/cotisation/cotisation_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/repository/npl_treat_request_exception.dart';

class CollectDetailBloc extends Bloc<CollectDetailEvent,CollectDetailState>{
  CollectRepo collectRepo;
  CotisationRepo cotisationRepo;

  int aa=0;
  CollectDetailBloc({
    required this.collectRepo,
    required this.cotisationRepo})
      :super(CollectDetailState()){
    on<CollectDetailLoad>(load);
    on<CollectDetailComplete>(loadComplete);
    on<CollectDetailUpdate>(onUpdate);


  }

  Future<void>load(CollectDetailLoad event,Emitter<CollectDetailState> emit)async{
    if(event.collect.cotisations != null){
      emit(state.copyWith(cotisations: event.collect.cotisations));
    }
    else{
      add(CollectDetailComplete(event.collect));
    }
  }

 Future<void> loadComplete(CollectDetailComplete event , Emitter<CollectDetailState> emit)async{
    emit(state.copyWith(status: CollectDetailStatus.loading));
    cotisationRepo.findByCollectId(event.collect.id).then((value){
      add(CollectDetailUpdate(status: CollectDetailStatus.success,cotisations: value,message: ''));
    }).catchError((error){
      aa++;
      if(aa>1){
        add(CollectDetailUpdate(status: CollectDetailStatus.success,cotisations: CotisationData(50).getData(),message: ''));
      }
      else{
        String message;
        if(error is NplTreatRequestException) message=error.message;
        else message =  AppConst.no_connexion;
        add(CollectDetailUpdate(status: CollectDetailStatus.error,message: message));

      }

    });

  }

  Future<void> onUpdate(CollectDetailUpdate event,Emitter<CollectDetailState> emit) async{
    emit(state.copyWith(status:event.status,cotisations: event.cotisations,message:event.message));
  }
}

class CollectDetailEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CollectDetailLoad extends CollectDetailEvent{
  Collect collect;
  CollectDetailLoad(this.collect);
  List<Object?> get props => [collect];
}
class CollectDetailComplete extends CollectDetailEvent{
  Collect collect;
  CollectDetailComplete(this.collect);
  List<Object?> get props => [collect];
}

class CollectDetailUpdate extends CollectDetailEvent{
  List<Cotisation> ? cotisations;
  String ? message;
  CollectDetailStatus ? status;
  CollectDetailUpdate({this.status,this.message, this.cotisations});
  List<Object?> get props => [cotisations];
}

enum CollectDetailStatus{init,loading,error,success}
class CollectDetailState extends Equatable{
  List<Cotisation> cotisations;
  CollectDetailStatus status;
  String message;

  CollectDetailState({
    List<Cotisation> ? cotisations,
    CollectDetailStatus status= CollectDetailStatus.init,
    String ? message,
  }):
   cotisations=cotisations ?? [],
   status  =status,
   message= message ?? '';

  CollectDetailState copyWith({
    List<Cotisation>  ?cotisations,
    CollectDetailStatus ? status,
    String ? message,
  })=>CollectDetailState(
    cotisations: cotisations ?? this.cotisations,
    status:  status ?? this.status,
    message: message ?? this.message,
  );


  @override
  // TODO: implement props
  List<Object?> get props => [cotisations,status,message];
}
