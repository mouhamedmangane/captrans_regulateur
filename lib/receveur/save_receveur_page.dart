import 'package:captrans_regulateur/bloc/receveur/save/receveur_save_bloc.dart';
import 'package:captrans_regulateur/model/receveur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/ui/input/npl_text_field_phone.dart';
import 'package:noppal_util/validator/input/not_empty_validator.dart';
import 'package:noppal_util/validator/validator_usine.dart';
class SaveReceveurParam{
  ReceveurSaveOperationType  operationType;
  Function(BuildContext,Receveur) ? onValidate;
  SaveReceveurParam({this.operationType=ReceveurSaveOperationType .add,this.onValidate});
}
class SaveReceveurPageArg extends StatelessWidget{

  static const routeName="/receveur/add_receveur_args";

  @override
  Widget build(BuildContext context) {
    SaveReceveurParam param =  ModalRoute.of(context)!.settings.arguments as SaveReceveurParam;
    return SaveReceveurPage(
      operationType: param.operationType ,
      onValidate:  param.onValidate,
    );
  }

}
class SaveReceveurPage extends StatelessWidget {

  static const routeName="/receveur/add_receveur";

  final ReceveurSaveOperationType operationType;
  final Function(BuildContext,Receveur) ? onValidate;

  const SaveReceveurPage({
    this.operationType=ReceveurSaveOperationType.add,
    this.onValidate,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReceveurSaveBloc>(
        create: (context) => ReceveurSaveBloc(operationType: operationType),
      child: SaveReceveurView(onValidate: onValidate,),
    );
  }
}

class SaveReceveurView extends StatefulWidget {
  final Function(BuildContext,Receveur) ? onValidate;

  const SaveReceveurView({this.onValidate,Key? key}) : super(key: key);

  @override
  State<SaveReceveurView> createState() => _SaveReceveurViewState();
}

class _SaveReceveurViewState extends State<SaveReceveurView> {

  TextEditingController _controllerNom= TextEditingController();
  TextEditingController _controllerTel= TextEditingController();
  GlobalKey<FormState> _formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nouveau receveur'),
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.person_pin_rounded,size: 90,color: Colors.grey.shade800,),
                ),
                TextFormField(
                  controller: _controllerNom,
                  style: TextStyle(fontSize: 18),
                  validator: (value){
                    return ValidationUsine.make(value,'nom complet',[
                      NotEmptyValidator()
                    ]);
                  },
                  decoration: InputDecoration(
                    label: Text("Prénom et nom"),
                  ),

                ),
                SizedBox(height: 15,),
                NplTextFieldPhone(
                 style: TextStyle(fontSize: 18),
                  disableValidate: false,
                  onChanged: (number){
                  _controllerTel.text=number;
                  print(number);
                 },
                  minLength: 12,
                  maxLength: 12,
                ),
                SizedBox(height: 30,),
                BlocListener<ReceveurSaveBloc,ReceveurSaveState>(
                  listener: (context,state){
                    print('testtt');
                    if(state.status == ReceveurSaveStatus.done){
                      if(widget.onValidate!= null){
                        widget.onValidate!(context,state.receveur!);
                      }
                    }
                  },
                  child: _buttonValidation(context),
                )
              ],
            ),
        ),
      ),
    );
  }

  Widget _buttonValidation(BuildContext context){
    return Container(
      width: 150,
      height: 45,
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)))
          ),
          onPressed:(){
            if(_formKey.currentState!.validate()){
              context.read<ReceveurSaveBloc>()..add(ReceveurSaveSubmit(nom: _controllerNom.text, tel: _controllerTel.text));
            }

          },
          child: Text("Ajouter  >",style: TextStyle(fontSize: 17),)
      ),
    );
  }
}

