part of 'receveur_save_bloc.dart';

class ReceveurSaveEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ReceveurSaveSubmit extends ReceveurSaveEvent{
  final String nom;
  final String tel;

  ReceveurSaveSubmit({ required this.nom, required this.tel});
  List<Object?> get props => [nom,tel];
}

class ReceveurSaveWantChangeOp extends ReceveurSaveState{
  final ReceveurSaveOperationType type;
  ReceveurSaveWantChangeOp(this.type);
  List<Object?> get props => [type] ;
}