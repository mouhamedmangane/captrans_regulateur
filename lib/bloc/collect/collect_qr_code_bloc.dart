




import 'package:bloc/bloc.dart';
import 'package:captrans_regulateur/repository/user/user_local_repo.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';
import 'package:noppal_util/repository/npl_treat_request_exception.dart';

import '../../app_const.dart';

class CollectQrCodeBloc extends Cubit<SimpleLoadableState<String>>{
  UserLocalRepo _userLocalRepo;
  CollectQrCodeBloc({required UserLocalRepo userLocalRepo}):
  _userLocalRepo=userLocalRepo,
  super(SimpleLoadableState.init());


  load()async{

    emit(SimpleLoadableState.loading());
    await Future.delayed(Duration(milliseconds: 500));

    await _userLocalRepo.getUser().then((user) {
      emit(SimpleLoadableState.done('noppal_captrans_qrcode_${user.id}'));
    }).catchError((error){
      String message='';
      if(error is NplTreatRequestException) message=error.message;
      else message =  AppConst.no_connexion;
      emit(SimpleLoadableState.error(message));
    });
  }


}