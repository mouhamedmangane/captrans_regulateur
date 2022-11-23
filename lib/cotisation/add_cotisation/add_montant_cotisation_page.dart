import 'package:captrans_regulateur/bloc/cotisation/addcotisation/add_cotisation_bloc.dart';
import 'package:captrans_regulateur/cotisation/add_cotisation/resume_cotisation_view.dart';
import 'package:captrans_regulateur/cotisation/cotisation_page.dart';
import 'package:captrans_regulateur/my_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/ui/inputs/npl_input_formatters/npl_separator_format.dart';

class AddMontantCotisationPage extends StatelessWidget {
  static const  String routeName="/add_cotisation/add_montant";
  const AddMontantCotisationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AddMontantCotisationView();
  }
}

class AddMontantCotisationView extends StatefulWidget {
  const AddMontantCotisationView({Key? key}) : super(key: key);

  @override
  State<AddMontantCotisationView> createState() => _AddMontantCotisationViewState();
}

class _AddMontantCotisationViewState extends State<AddMontantCotisationView> {
  TextEditingController _controller=TextEditingController();
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Ajouter Montant"),
          elevation: 2,
          titleSpacing: 0,
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: _form(),
              ),
              SizedBox(height: 25,),
              _buttonValidation(context),
            ],
          ),
        ),
        bottomSheet:BlocBuilder<AddCotisationBloc,AddCotisationState>(
          builder: (context,state){
            if(state.bus!=null && state.receveur!=null){
              return ResumeCotisationView(bus: state.bus!,receveur: state.receveur,);
            }
            return Container(height: 150);
          },
        ) ,
      );
  }
  Widget _buttonValidation(BuildContext context){
    return Container(
          width: 150,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: BlocListener<AddCotisationBloc,AddCotisationState>(
            listener: (context,state) {
              if(state.status==AddCotisationStatus.success){
                print('mus listener');
                Navigator.pushNamedAndRemoveUntil(
                    context,
                    CotisationPageArgs.routeName,
                        (route) => route.settings!.name == MyHomePage.routeName,
                    arguments: CotisationParam(
                      cotisation:state.cotisation!,
                      mustCompleted: false,
                    )
                );
              }
            },
            child: ElevatedButton(
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)))
                ),
                onPressed:(){
                  _formKey.currentState!.validate();
                  if( (_controller.text ??'').replaceAll(" ", '').isNotEmpty){
                    print(_controller.text.trim());
                    int montant = int.parse(_controller.text.replaceAll(' ', '')).toInt();
                    print('test');
                    BlocProvider.of<AddCotisationBloc>(context).add(AddCotisationValidation(montant));
                  }
                },
                child: Text("Valider",style: TextStyle(fontSize: 17),)
            ),
          ),
        );
  }
  Widget _form(){
    return Form(
      key: _formKey,
      child: BlocBuilder<AddCotisationBloc,AddCotisationState>(
        builder: (context,state) {
          String ?message=(state.status == AddCotisationStatus.failure)
              ?state.message : '';
          return TextFormField(
            autofocus: true,
            validator: (value){
              if((value??'').replaceAll(" ", '').isEmpty)
                return 'le montant ne peut pas etre null';
              return null;
            },
            controller: _controller ,
            onChanged: (txt){
              print('test');
              print((txt ??"").replaceAll(' ', ''));
            },
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              //LengthLimitingTextInputFormatter(3),
              NplSeparatorTextEditing(),
            ],
            style: TextStyle(fontSize: 28),
            keyboardType: TextInputType.number,
            decoration:  InputDecoration(
              label: Text('Montant cotisation'),
              errorText: message ,
              suffix: (state.status == AddCotisationStatus.loading)
                  ? SizedBox(child: CircularProgressIndicator(),height: 25,width: 25,)
                  :null,
            ),
          );
        }
      ),
    );
  }
}

