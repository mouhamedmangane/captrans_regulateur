

import 'package:bloc/bloc.dart';
import 'package:captrans_regulateur/app_const.dart';
import 'package:captrans_regulateur/model/cotisation.dart';
import 'package:captrans_regulateur/model_dto/cotisation_resume.dart';
import 'package:captrans_regulateur/model_dto/cotisation_success.dart';
import 'package:captrans_regulateur/repository/cotisation/cotisation_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:noppal_util/repository/npl_treat_request_exception.dart';

import '../../model/bus.dart';

class CotisationBloc extends Bloc<CotisationEvent,CotisationState>{
  CotisationRepo cotisationRepo;
  CotisationBloc({required this.cotisationRepo}) :

        super(const CotisationState()){
    on<CotisationInit>(_onInit);
    on<CotisationCompleted>(_onComplete);
    on<CotisationLoadWithCotisation>(_onLoadCotisation);
    on<CotisationLoadWithCotisationSuccess>(_onLoadCotisationSuccess);
    on<CotisationLoadWithId>(_onLoadCotisationId);
    on<CotisationError>(_onError);
  }

  Future<void> _onInit(CotisationInit event,Emitter<CotisationState> emit)async {
    emit(state.copyWith(status: CotisationStatus.init));
    if(event.ob is Cotisation){
      add(CotisationLoadWithCotisation(event.ob));
    }
    else if(event.ob is CotisationSuccess) {
      add(CotisationLoadWithCotisationSuccess(event.ob));
    } else if(event.ob is int) {
      add(CotisationLoadWithId(event.ob));
    } else {
      throw Exception('Type initialise non autorisé');
    }
  }



  Future<void> _onLoadCotisation(CotisationLoadWithCotisation event,Emitter<CotisationState> emit) async{
    emit(state.copyWith(
        status: CotisationStatus.loadingComplete,
        cotisationId: event.cotisation.id,
        cotisation: event.cotisation,
        bus: null,cotisationAuto: null,
        resumeLastCotisation: null
    ));
    add(CotisationCompleted(event.cotisation.id,isPrevLoadingComplete: true));
  }

  Future<void> _onLoadCotisationId(CotisationLoadWithId event,Emitter<CotisationState> emit) async{
    emit(state.copyWith(status: CotisationStatus.loading,cotisationId: event.id));
    add(CotisationCompleted(event.id));
  }

  Future<void> _onLoadCotisationSuccess(CotisationLoadWithCotisationSuccess event,Emitter<CotisationState> emit)async{
    print('testttttttttttttttt');
    print(event.cotisationSuccess.cotisation);
    emit(state.copyWith(
      status: CotisationStatus.success,
      cotisationId: event.cotisationSuccess.cotisation.id,
      bus: event.cotisationSuccess.bus,
      cotisation: event.cotisationSuccess.cotisation,
      cotisationAuto: event.cotisationSuccess.cotisationAuto,
      resumeLastCotisation: event.cotisationSuccess.lastCotisation,
    ));
  }

  Future<void> _onComplete(CotisationCompleted event,Emitter<CotisationState> emit) async{
      cotisationRepo.getDetail(event.id).then((value) {
        print('sssssssssssssssss');
        add(CotisationLoadWithCotisationSuccess(value));
      }).catchError((error){
        String message;
        if(error is NplTreatRequestException) {
          message=error.message;
        } else {
          message =  AppConst.noConnexion;
        }
        if(event.isPrevLoadingComplete) {
          add(CotisationError(CotisationStatus.errorComplete,message));
        } else {
          add(CotisationError(CotisationStatus.error,message));
        }
        throw error;
      });

  }

  Future <void> _onError(CotisationError event,Emitter<CotisationState> emit) async{
    emit(state.copyWith(status: event.status,message: event.message));
  }

}

class CotisationEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CotisationInit extends CotisationEvent{
  final dynamic ob;
  CotisationInit(this.ob);
  List<Object?> get props => [ob];
}

class CotisationLoadWithCotisationSuccess extends CotisationEvent{
  final CotisationSuccess cotisationSuccess;
  CotisationLoadWithCotisationSuccess(this.cotisationSuccess);
  @override
  List<Object?> get props => [cotisationSuccess];
}

class CotisationLoadWithCotisation extends CotisationEvent{
  final Cotisation cotisation;
  CotisationLoadWithCotisation(this.cotisation);
  @override
  List<Object?> get props => [cotisation];
}

class CotisationLoadWithId extends CotisationEvent{
  final  int id;
  CotisationLoadWithId(this.id);
  @override
  List<Object?> get props => [id];
}

class CotisationCompleted extends CotisationEvent{
  final int id;
  final bool isPrevLoadingComplete;
  CotisationCompleted(this.id, {this.isPrevLoadingComplete = false});
  @override
  List<Object?> get props => [id,isPrevLoadingComplete];
}

class CotisationError extends CotisationEvent{
  final String message;
  final CotisationStatus status;
  CotisationError(this.status,this.message);
  @override
  List<Object?> get props => [status,message];
}



enum CotisationStatus {init,loading,errorComplete,loadingComplete,error,success}

class CotisationState extends Equatable{
  final CotisationStatus status;
  final Cotisation ? cotisation;
  final Bus ? bus;
  final Cotisation ? cotisationAuto;
  final CotisationResume ? resumeLastCotisation;
  final String ? message;
  final int ?  cotisationId;

  const CotisationState({
    this.status=CotisationStatus.init,
    this.cotisation,
    this.bus,
    this.cotisationAuto,
    this.resumeLastCotisation,
    this.message,
    this.cotisationId,
  });

  CotisationState copyWith({
    CotisationStatus ? status,
    Cotisation ? cotisation,
    Bus ? bus,
    Cotisation ? cotisationAuto,
    CotisationResume ? resumeLastCotisation,
    String ? message,
    int ? cotisationId,
  })=> CotisationState(
    status: status ?? this.status,
    cotisation: cotisation ?? this.cotisation,
    bus: bus ?? this.bus,
    cotisationAuto: cotisationAuto ?? this.cotisationAuto,
    resumeLastCotisation: resumeLastCotisation ?? this.resumeLastCotisation,
    message: message ?? this.message,
    cotisationId: cotisationId ?? this.cotisationId,
  );


  @override
  // TODO: implement props
  List<Object?> get props => [status,cotisation,bus,cotisationAuto,resumeLastCotisation,message,cotisationId];

}