




import 'package:bloc/bloc.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';

import '../../repository/collect/collect_repo.dart';

class CollectQrCodeBloc extends Cubit<SimpleLoadableState<String>>{
  CollectRepo _collectRepo;
  CollectQrCodeBloc(CollectRepo collectRepo):
  _collectRepo=collectRepo,
  super(SimpleLoadableState.init());



}