


import 'package:captrans_regulateur/bloc/fcm/fcm_bloc.dart';
import 'package:captrans_regulateur/bloc/user/user_ligne_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/bloc/enum_loadable_state.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';

import '../notification_fcm/key_fcm.dart';

class ListLigneUserTile extends StatelessWidget {
  const ListLigneUserTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.route),
      title:Text('Lignes autorisées') ,
      subtitle: _list(),
    );
  }

  Widget _list(){
    return BlocListener<FcmBloc,FcmState>(
      listener: (context,fcmState){
        if(fcmState.data!['name'] == KeyFcm.MODIFIER_LIGNE_USER){
          context.read<UserLigneCubit>().load();
        }
      },
      child: BlocBuilder<UserLigneCubit,SimpleLoadableState<List<String>>>(
        builder: (context,state){
          if(state.state == EnumLoadableState.DONE){
            if(state.value!.isEmpty)
              return Text('aucun');
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Wrap(
                spacing: 8,
                alignment:  WrapAlignment.end,
                children: state.value!.map((e) =>
                    CircleAvatar(child: Text(e),radius: 18,)
                  ).toList()
              ),
            );
          }
          else if(state.state == EnumLoadableState.ERROR){
            return Text('Probleme de recuperation, veillez réessayer en glissant la page');
          }
          else{
            return Text('...');
          }
        },
      ),
    );
  }
}
