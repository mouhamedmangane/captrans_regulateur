

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:noppal_util/conf/env.dart';
import 'package:noppal_util/repository/npl_treat_request_exception.dart';

import '../../app_const.dart';
import '../../model/user.dart';
import '../../repository/user/user_dis_repo.dart';
import '../../repository/user/user_local_repo.dart';

class ChangePwdBloc extends Bloc<ChangePwdEvent,ChangePwdState>{
  final UserLocalRepo _userLocalRepo;
  final UserDisRepo _userDisRepo;
  ChangePwdBloc({
    required UserLocalRepo userLocalRepo,
    required UserDisRepo userDisRepo,
  }):
  _userLocalRepo=userLocalRepo,
  _userDisRepo=userDisRepo,
  super(const ChangePwdState()){
    on<ChangePwdValidate>(_validate);
    on<ChangePwdToggleMask>(_toggleMask);
  }

  Future<void> _validate(ChangePwdValidate event,Emitter<ChangePwdState> emit)async {
    emit(state.copyWith(status: ChangePwdStatus.loading,message: null,ancien: null,nouveauError: null,confirmationError: null));
    int id=MyConf.getNum(MyConfConstUser.ID_KEY).toInt();
    await _userDisRepo.changePwd(id,event.ancien, event.nouveau,event.confirmation).then((value){
        emit(state.copyWith(status:ChangePwdStatus.done));
        User user=MyConf.getValue<User>(MyConfConstUser.USER_KEY);
        _userLocalRepo.save(user.copyWith(code: event.nouveau));
    }).catchError((error){
      String message;
      String ? ancien;
      String ? nouveau;
      String ? confirmation;
      if(error is NplTreatRequestException) {
        message=error.message;

        if(error.errors != null){

          ancien=error.errors!.containsKey('password')?(error.errors!['password'] as List).join('. '):null;
          nouveau=error.errors!.containsKey('new_password')?(error.errors!['new_password'] as List).join('. '):null;
          confirmation=error.errors!.containsKey('new_password_confirmation')?(error.errors!['new_password_confirmation']as List).join('. '):null;
        }

      } else if(error is TimeoutException) {
        message=AppConst.timeout;
      } else {
        message =  AppConst.noConnexion;
      }
      emit(state.copyWith(status:ChangePwdStatus.error,message: message,ancienError: ancien,nouveauError: nouveau,confirmationError: confirmation));
    });
  }

  Future<void> _toggleMask(ChangePwdToggleMask event,Emitter<ChangePwdState> emit)async {
    emit(state.copyWith(activeText: (!state.activeText)));
  }

}




class ChangePwdEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class ChangePwdValidate extends ChangePwdEvent{
  final String  ancien;
  final String  nouveau;
  final String  confirmation;
  ChangePwdValidate({
    required this.ancien,
    required this.nouveau,
    required this.confirmation,
  });
  @override
  List<Object?> get props => [ancien,nouveau,confirmation];
}
class ChangePwdToggleMask extends ChangePwdEvent{}



enum ChangePwdStatus {init,loading,error,done}

class ChangePwdState extends Equatable{
  final String ?  ancien;
  final String ? ancienError;
  final String ? nouveau;
  final String ? nouveauError;
  final String ? confirmation;
  final String ? confirmationError;
  final ChangePwdStatus status;
  final String ? message;
  final bool activeText;

 const ChangePwdState({
    this.ancien,
    this.nouveau,
    this.confirmation,
    this.ancienError,
    this.nouveauError,
    this.confirmationError,
    this.status=ChangePwdStatus.init,
    this.activeText=true,
    this.message,
  });

  ChangePwdState copyWith({
    String ? ancien,
    String ? nouveau,
    String ? confirmation,
    String ? ancienError,
    String ? nouveauError,
    String ? confirmationError,
    ChangePwdStatus ? status,
    String ? message,
    bool ? activeText,
  })=>ChangePwdState(
    ancien: ancien ?? this.ancien,
    nouveau: nouveau ?? this.nouveau,
    confirmation: confirmation ?? this.confirmation,
    ancienError: ancienError ?? this.ancienError,
    nouveauError: nouveauError ?? this.nouveauError,
    confirmationError: confirmationError ?? this.confirmationError,
    status:status ?? this.status,
    message: message ?? this.message,
    activeText: activeText ?? this.activeText,
  );


  @override
  List<Object?> get props => [ancien, nouveau, confirmation,ancienError,nouveauError,confirmationError,status,activeText,message,];

}