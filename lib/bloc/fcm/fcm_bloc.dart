import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class FcmBloc extends Bloc<FcmEvent,FcmState>{
  FcmBloc():super(FcmState()){
    on<FcmArrived>(newFcm);
  }
  Future<void> newFcm(FcmArrived event,Emitter<FcmState> emit) async{
    print('tessssssssssssssssssssss');

    emit(FcmState(title: event.title,message: event.message,data: event.data));
  }
}
class FcmEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FcmArrived extends FcmEvent{
  final String ? title;
  final String ? message;
  final Map<String,dynamic> ? data;
  FcmArrived({this.title, this.message, this.data});
  List<Object?> get props => [title,message,data];
}

class FcmState extends Equatable{
  final String ? title;
  final String ? message;
  final Map<String,dynamic> ? data;

  FcmState({
    this.title,
    this.message,
    this.data,
  });

  FcmState copyWith({
    String ? title,
    String ? message,
    Map<String,dynamic> ? data,
  })=>FcmState(
      title : title ?? this.title,
      message : message ?? this.message,
      data : data ?? this.data
  );

  @override
  // TODO: implement props
  List<Object?> get props => [message,title,data];

}