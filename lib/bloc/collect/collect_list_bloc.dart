
import 'package:bloc/bloc.dart';
import 'package:captrans_regulateur/model/collect.dart';
import 'package:captrans_regulateur/modelDataTest/collect_data.dart';
import 'package:captrans_regulateur/repository/collect/collect_repo.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';
import 'package:noppal_util/repository/npl_treat_request_exception.dart';

class CollectListBloc extends Cubit<SimpleLoadableState<List<Collect>>>{
  CollectRepo _collectRepo;
  int tt=0;
  CollectListBloc({required CollectRepo collectRepo}):
    _collectRepo=collectRepo,
    super(SimpleLoadableState.init());

  Future<void> load() async{
    emit(SimpleLoadableState.loading());
    _collectRepo.findLastCollects(1).then((value){
      emit(SimpleLoadableState.done(value));
    }).catchError((error){
      tt++;
      if(tt>1){
        emit(SimpleLoadableState.done(CollectData(5).getData()));
        return;
      }
      String message;
      if(error is NplTreatRequestException){
        message=error.message;
      }
      else{
        message=error.toString();
      }
      emit(SimpleLoadableState.error(message));
    });
  }
}