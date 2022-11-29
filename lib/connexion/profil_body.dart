

import 'package:captrans_regulateur/connexion/photo_profil_view.dart';
import 'package:captrans_regulateur/ui/listitem/cle_valeur_view.dart';
import 'package:flutter/material.dart';
import 'package:noppal_util/conf/env.dart';

import '../model/user.dart';

class ProfilBody extends StatelessWidget {
  const ProfilBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user=MyConf.getValue(MyConfConstUser.USER_KEY);
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 10,right: 10,top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _profil(user),
            SizedBox(height: 10,),
            _comple_profil(user),
            SizedBox(height: 10,),
            _deconnexion(),

          ],
        ),
      ),
    );
  }

  Widget _profil(User user){
    return Container(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            PhotoProfilView(),
            SizedBox(height: 15,),
            Text('${user.nom}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }


  Widget editBtn(Function() onPressed){
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
            valeur:Chip(label: Text(' ${user.foncion} ',style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue),
          ),
          ListTile(
              leading: Icon(Icons.phone_outlined),
              title:Text('Téléphone') ,
              trailing: Text('${user.tel}'),

          ),
          CleValeurView(
              icon: Icons.streetview_outlined,
              cle:Text('Adresse') ,
              valeur:Text('${user.adresse}'),
          ),
          CleValeurView(
            icon: Icons.email_outlined,
            cle:Text('Email') ,
            valeur:Text('${user.email}'),
          ),



        ],
      ),
    );
  }

  Widget _deconnexion(){
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
      child: Column(
        children: [

          CleValeurView(
              icon: Icons.privacy_tip_outlined,
              cle:Text('Changer mot de passe') ,
              valeur: editBtn(() {

              },)
          ),
          ListTile(
            leading: Icon(Icons.settings_power_outlined,),
            title: Text('Déconnexion',style: TextStyle(),),
          )
        ],
      ),
    );
  }

}
