
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/validator/input/not_empty_validator.dart';
import 'package:noppal_util/validator/validator_usine.dart';

import '../bloc/user/change_password_bloc.dart';
import '../repository/user/user_dis_repo.dart';
import '../repository/user/user_local_repo.dart';

class ChangePwdPage extends StatelessWidget {
  const ChangePwdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChangePwdBloc>(
      create:(context)=>ChangePwdBloc(userDisRepo: context.read<UserDisRepo>(),userLocalRepo: context.read<UserLocalRepo>()),
      child:const ChangePwdView() ,
    );
  }
}

class ChangePwdView extends StatefulWidget {
  const ChangePwdView({Key? key}) : super(key: key);

  @override
  State<ChangePwdView> createState() => _ChangePwdViewState();
}

class _ChangePwdViewState extends State<ChangePwdView> {
  TextEditingController _ancienController=TextEditingController();
  TextEditingController _nouveauController =  TextEditingController();
  TextEditingController _confirmationController = TextEditingController();
  final GlobalKey<FormState> _key=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifier Mot de passe'),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: Form(
            key: _key,
            child: Column(
              children: [
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  //  Icon(Icons.password_outlined,size: 50,color: Colors.grey.shade300,),
                    Icon(Icons.edit,size: 50,color: Colors.grey.shade300,),

                  ],
                ),
                SizedBox(height: 15,),
                _message(),
                _ancienWidget(context),
                SizedBox(height: 10,),
                _nouveauWidget(context),
                SizedBox(height: 10,),
                _confirmationWidget(context),
                SizedBox(height: 15,),
                ListTile(
                  minLeadingWidth: 0,
                  contentPadding: EdgeInsets.zero,
                  title: Text("Afficher les mots de passe"),
                  trailing: Switch(
                    onChanged: (response){
                      context.read<ChangePwdBloc>().add(ChangePwdToggleMask());
                    }, value: false,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        height: 45,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: BlocConsumer<ChangePwdBloc,ChangePwdState>(
          listener: (context,state){
            if(state.status==ChangePwdStatus.done){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    padding: EdgeInsets.all(15),
                    backgroundColor:  Colors.green.shade600,
                    shape: RoundedRectangleBorder(
                     // borderRadius: BorderRadius.circular(15)
                    ),
                    content: Text("Mot de passe modifier avec succés,",style: TextStyle(color: Colors.white),),
                  )
              );
              Navigator.pop(context);
            }
          },
          builder:(context,state) {
            return ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ))

              ),
                onPressed: (){
                  if(state.status !=ChangePwdStatus.loading){
                    if(_key.currentState!.validate()){
                      context.read<ChangePwdBloc>().add(ChangePwdValidate(
                          ancien: _ancienController.text,
                          nouveau: _nouveauController.text,
                          confirmation: _confirmationController.text)
                      );
                    }
                  }
                },
              child: Text('Changer'),
              );
          }

        ),
      ),
    );
  }

  Widget _ancienWidget(BuildContext context){
    return BlocBuilder<ChangePwdBloc,ChangePwdState>(
      builder: (context,state){
        return TextFormField(
          controller: _ancienController,
          obscureText: state.activeText,
          initialValue: state.nouveau,
          validator: (text){
            return ValidationUsine.make(text,'ancien',[
              NotEmptyValidator()
            ]);
          },
          decoration: InputDecoration(
            hintText: "Ancien mot de passe",
            errorText: state.ancienError,
          ),
        );
      },
    );
  }

  Widget _nouveauWidget(BuildContext context){
    return BlocBuilder<ChangePwdBloc,ChangePwdState>(
      builder: (context,state){
        return TextFormField(
          controller: _nouveauController,
          obscureText: state.activeText,
          initialValue: state.nouveau,
          validator: (text){
            return ValidationUsine.make(text,'nouveau',[
              NotEmptyValidator()
            ]);
          },
          decoration: InputDecoration(
            hintText: "Nouveau mot de passe",
            errorText: state.nouveauError
          ),
        );
      },
    );
  }

  Widget _confirmationWidget(BuildContext context){
    return BlocBuilder<ChangePwdBloc,ChangePwdState>(
      builder: (context,state){
        return TextFormField(
          controller: _confirmationController,
          obscureText: state.activeText,
          initialValue: state.confirmation,
          validator: (text){
            return ValidationUsine.make(text,'confirmation',[
              NotEmptyValidator()
            ]);
          },
          decoration: InputDecoration(
            hintText: "Confirmation ",
            errorText: state.confirmationError,
          ),
        );
      },
    );
  }

  Widget _message(){
    return BlocBuilder<ChangePwdBloc,ChangePwdState>(
      builder: (context,state){
        return Text(state.message??'',style: TextStyle(color:Colors.red),);
      },
    );
  }

}

