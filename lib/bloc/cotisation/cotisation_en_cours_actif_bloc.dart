

import 'package:bloc/bloc.dart';

enum CotisationEnCoursViewEnum{ ALL,PAR_JOUR}
class CotisationEnCoursActifBloc extends Cubit<CotisationEnCoursViewEnum>{
  CotisationEnCoursActifBloc():super(CotisationEnCoursViewEnum.ALL);

  Future<void> changerState(CotisationEnCoursViewEnum c) async{
    emit(c);
  }

}