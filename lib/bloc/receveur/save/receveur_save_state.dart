part of 'receveur_save_bloc.dart';

enum ReceveurSaveOperationType{add,update}
enum ReceveurSaveStatus{init,loading,faillure,done}
class ReceveurSaveState extends Equatable{
  final Receveur ? receveur;
  final ReceveurSaveOperationType operationType;
  final ReceveurSaveStatus status;

  ReceveurSaveState({
    this.status= ReceveurSaveStatus.init,
    this.receveur,
    this.operationType=ReceveurSaveOperationType.add,
  });

  ReceveurSaveState copyWith({
    ReceveurSaveStatus ? status,
    Receveur ? receveur,
    ReceveurSaveOperationType ? operationType,
  })=> ReceveurSaveState(
    status: status ?? this.status,
    receveur: receveur ?? this.receveur,
    operationType: operationType ?? this.operationType,
  );


  @override
  // TODO: implement props
  List<Object?> get props => [receveur,operationType];


}