

import 'package:bloc/bloc.dart';

enum AppMaterialStatus{connexion,home}
class AppMaterialBloc extends Cubit<AppMaterialStatus>{
  AppMaterialBloc(super.initialState);
  change(AppMaterialStatus status){
    emit(status);
  }
}