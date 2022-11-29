import 'package:captrans_regulateur/bloc/collect/collect_qr_code_bloc.dart';
import 'package:captrans_regulateur/repository/user/user_local_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/bloc/enum_loadable_state.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../ui/button/error_body_smal_view.dart';

class CollectQrCodePage extends StatelessWidget {
  static const routeName="/qr_code";
  const CollectQrCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CollectQrCodeBloc>(
      create:(context)=>CollectQrCodeBloc(userLocalRepo: context.read<UserLocalRepo>())..load(),
      child: CollectQrCodeView(),
    );
  }
}


class CollectQrCodeView extends StatelessWidget {
  const CollectQrCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon Qrcode'),

        elevation: 0,
        scrolledUnderElevation: 1,
        backgroundColor: Colors.grey.shade50,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 10,right: 10,bottom: 55),
          width: double.infinity,
          height: 200,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue,

          ),
          child: BlocBuilder<CollectQrCodeBloc,SimpleLoadableState<String>>(
            builder: (context,state){
              if(state.state == EnumLoadableState.ERROR){
                return ErrorBodySmallView(
                  colorText: Colors.grey.shade50,
                  colorIcon: Colors.grey.shade50,
                  backgroundButton: Colors.blue.shade400,
                  onTap: (){
                    context.read<CollectQrCodeBloc>().load();
                  },
                  title: "Echec chargement Qr code",
                  message: state.message!
                );
              }
              else if(state.state == EnumLoadableState.LOADING || state.state == EnumLoadableState.INIT){
                return Container(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(color: Colors.white,),
                );
              }
              else{
                return Container(
                  width: 150,
                  child: QrImage(
                    backgroundColor: Colors.white,
                      data: state.value!,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
