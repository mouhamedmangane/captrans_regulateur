




import 'package:bloc/bloc.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';
import 'package:noppal_util/conf/env.dart';
import 'package:noppal_util/repository/npl_treat_request_exception.dart';

import '../../app_const.dart';
import '../../repository/user/user_dis_repo.dart';

class CollectQrCodeBloc extends Cubit<SimpleLoadableState<String>>{
  final UserDisRepo _userDisRepo;
  CollectQrCodeBloc({required UserDisRepo userDisRepo}):
  _userDisRepo=userDisRepo,
  super(SimpleLoadableState.init());


  load()async{

    emit(SimpleLoadableState.loading());
    await Future.delayed(const Duration(milliseconds: 500));
    int id=MyConf.getNum(MyConfConstUser.ID_KEY).toInt();

    await _userDisRepo.code(id).then((code) {
      emit(SimpleLoadableState.done(code));
    }).catchError((error){
      String message='';
      if(error is NplTreatRequestException) {
        message = error.message;
      } else {
        message = AppConst.noConnexion;
      }
      emit(SimpleLoadableState.error(message));
    });
  }


}