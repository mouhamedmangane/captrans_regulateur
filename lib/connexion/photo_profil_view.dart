import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:noppal_util/bloc/enum_loadable_state.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';
import 'package:noppal_util/repository/dis_repo.dart';
import 'package:path_provider/path_provider.dart';

import '../bloc/user/photo_profil_bloc.dart';
import '../model/user.dart';
import '../repository/user/user_dis_repo.dart';
import '../repository/user/user_local_repo.dart';

class PhotoProfilView extends StatelessWidget {
  final User user;
  const PhotoProfilView({required this.user,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>PhotoProfilBloc(userDisRepo: context.read<UserDisRepo>(), userLocalRepo: context.read<UserLocalRepo>())..init(),
      child: PhotoProfilRealView(user: user,),
    );
  }
}

class PhotoProfilRealView extends StatelessWidget {
  final User user;
  const PhotoProfilRealView({required this.user,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(width: 2,color: Colors.grey.shade50),
                borderRadius: BorderRadius.circular(92,)
            ),
            child: ClipOval(
              child: BlocBuilder<PhotoProfilBloc,SimpleLoadableState<String>>(
                  builder: (context,state) {
                    if(state.state == EnumLoadableState.LOADING){
                      return _loading(context);
                    }
                    else if (state.state == EnumLoadableState.DONE){
                      return _done(context,state.value);
                    }
                    else{
                      return _error(context);
                    }

                  }
              ),
            ),
          ),

          Positioned(
              bottom: 0,
              right: -25,
              child: RawMaterialButton(
                onPressed: () {
                  _onChange(context);
                },
                elevation: 2.0,
                fillColor: Color(0xFFF5F6F9),
                child: Icon(Icons.camera_alt_outlined, color: Colors.blue,),
                padding: EdgeInsets.all(15.0),
                shape: const CircleBorder(),
              ))
        ],
      ),
    );
  }

  Widget _error(BuildContext context){
    return  Image.asset("asset/images/person.png",
      width: 50,
      height: 0,fit:
      BoxFit.cover,
    );
  }
  Widget _loading(BuildContext context){
    return const CircularProgressIndicator();
  }
  Widget _done(BuildContext context,String? state){

    if(state==null){
      if(user.profil!=null){
        return CachedNetworkImage(imageUrl: DisRepo.getGlobalUrl('${user.profil}'),fit: BoxFit.cover,);
      }
      else{
        return _error(context);
      }
    }
    else{
      return Image.file(File(state),
        width: 50,
        height: 0,fit:
        BoxFit.cover,
      );
    }

  }

  Future<void> _onChange(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if(image!=null){
      String path= (await getApplicationDocumentsDirectory()).path+'/'+image.name;
      print(path);

      context.read<PhotoProfilBloc>().changePhoto(image,path);

    }
  }
}
