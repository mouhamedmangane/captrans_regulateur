import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:noppal_util/bloc/enum_loadable_state.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';
import 'package:noppal_util/conf/env.dart';

import '../../repository/user/user_dis_repo.dart';
import '../../repository/user/user_local_repo.dart';

class PhotoProfilBloc extends Cubit<SimpleLoadableState<String>>{
  final UserDisRepo _userDisRepo;
  final UserLocalRepo _userLocalRepo;
  PhotoProfilBloc({required UserDisRepo userDisRepo,required UserLocalRepo userLocalRepo}):
  _userDisRepo=userDisRepo,
  _userLocalRepo=userLocalRepo,
  super(const SimpleLoadableState.init());

  init()async{
    String ? path;
    await _userLocalRepo.isLoadedPhoto().then((ch){
      path=ch;
    }).catchError((err){
     path=null;
    });
    emit(SimpleLoadableState(value: path,state:EnumLoadableState.DONE));
  }

  changePhoto(XFile image, String path)async{
    emit(const SimpleLoadableState.loading());
    await image.saveTo(path);
    await _userLocalRepo.saveLoadedPhoto(path);
    print(path);
    print('goof');
    emit( SimpleLoadableState.done(path));
    int id=MyConf.getNum(MyConfConstUser.ID_KEY).toInt();
    await _userDisRepo.changeImage(id, image).then((value){

    }).catchError((error){
        throw error;
    });
  }

}
