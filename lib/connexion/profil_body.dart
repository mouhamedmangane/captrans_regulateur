

import 'package:captrans_regulateur/bloc/main/app_material_bloc.dart';
import 'package:captrans_regulateur/bloc/main/app_start_bloc.dart';
import 'package:captrans_regulateur/bloc/user/user_ligne_cubit.dart';
import 'package:captrans_regulateur/connexion/photo_profil_view.dart';
import 'package:captrans_regulateur/repository/user/user_local_repo.dart';
import 'package:captrans_regulateur/ui/listitem/cle_valeur_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/conf/env.dart';

import '../model/user.dart';
import '../print/print_page.dart';
import '../repository/user/user_dis_repo.dart';
import '../user/change_pwd_page.dart';
import 'list_ligne_tile.dart';




class ProfilBody extends StatelessWidget {
  const ProfilBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      UserLigneCubit(userDisRepo: context.read<UserDisRepo>())
        ..load(),
      child:PhotoProfilPPView(),
    );
  }
}

class PhotoProfilPPView extends StatelessWidget {
  const PhotoProfilPPView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = MyConf.getValue(MyConfConstUser.USER_KEY);

    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        elevation: 0,
        scrolledUnderElevation: 1,
        backgroundColor: Colors.grey.shade50,
        foregroundColor: Colors.black,
      ),
      body: RefreshIndicator(
        onRefresh: ()async{
          context.read<UserLigneCubit>().load();
        },
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Container(
            margin: EdgeInsets.only(left: 15,right: 15,top: 0,bottom: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _profil(user),
                SizedBox(height: 10,),
                _comple_profil(user),
                SizedBox(height: 10,),
                _lignesAutoriser(),
                SizedBox(height: 10,),
                _print(context),
                SizedBox(height: 10,),
                _deconnexion(context),

              ],
            ),
          ),
        ),
      ),
    );
  }





  Widget _profil(User user){
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          PhotoProfilView(user: user,),
          SizedBox(height: 15,),
          Text('${user.name}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
        ],
      ),
    );
  }


  Widget editBtn({Function()? onPressed}){
    return IconButton(onPressed: onPressed, icon: Icon(Icons.edit));
  }

  Widget _comple_profil(User user){
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          CleValeurView(
            icon: Icons.person_outline,
            cle:Text('Role') ,
            valeur:Text(' ${user.fonction} ',style: TextStyle()),
          ),
          ListTile(
              leading: Icon(Icons.phone_outlined),
              title:Text('Téléphone') ,
              trailing: Text('${user.tel}'),

          ),
          // CleValeurView(
          //     icon: Icons.home_outlined,
          //     cle:Text('Adresse') ,
          //     valeur:Text('${user.adresse}'),
          // ),
          // CleValeurView(
          //   icon: Icons.email_outlined,
          //   cle:Text('Email') ,
          //   valeur:Text('${user.email}'),
          // ),



        ],
      ),
    );
  }

  Widget _lignesAutoriser(){
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          ListLigneUserTile(),
        ],
      ),
    );
  }

  Widget _print(BuildContext context){
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.print_outlined),
            title:Text('Service Impression') ,
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: (){
              Navigator.pushNamed(context, PrintPage.routeName);
            },
          ),
        ],
      ),
    );
  }

  Widget _deconnexion(BuildContext context){
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
      child: Column(
        children: [

          CleValeurView(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePwdPage()));

            },
              icon: Icons.privacy_tip_outlined,
              cle:Text('Changer mot de passe') ,
              valeur: editBtn()
          ),
          ListTile(
            leading: Icon(Icons.settings_power_outlined,color: Colors.red,),
            title: Text('Déconnexion',style: TextStyle(color: Colors.red),),
            onTap: ()async{
              await context.read<UserLocalRepo>().cleanAll();
              await context.read<AppStartBloc>().change(1);
              context.read<AppMaterialBloc>().change(AppMaterialStatus.connexion);
            },
          )
        ],
      ),
    );
  }

}
