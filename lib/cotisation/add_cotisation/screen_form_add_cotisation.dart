import 'package:captrans_regulateur/bloc/cotisation/addcotisation/add_cotisation_bloc.dart';
import 'package:captrans_regulateur/bus/bus_resume.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/ui/croquis/card_croquis.dart';
import 'package:noppal_util/ui/inputs/npl_input_formatters/npl_separator_format.dart';


class ScreenFormAddCotisation extends StatefulWidget {


  const ScreenFormAddCotisation({Key? key}) : super(key: key);

  @override
  State<ScreenFormAddCotisation> createState() => _ScreenFormAddCotisationState();
}

class _ScreenFormAddCotisationState extends State<ScreenFormAddCotisation> {
  TextEditingController _controller=TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AddCotisationState state=BlocProvider.of<AddCotisationBloc>(context).state;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Ajout Cotisation'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [

            BlocBuilder<AddCotisationBloc,AddCotisationState>(
              buildWhen: (previous,current){

                return true;
              },
              builder: (context,state) {

                return CardCroquis(width: double.infinity, height: 150,);
              }
            ),
            SizedBox(height: 15,),
            BlocBuilder<AddCotisationBloc,AddCotisationState>(
                builder: (contex,state) {

                      return Text("state.message",style: TextStyle(color: Colors.red,fontSize: 18),);
                }),
            SizedBox(height: 15,),
            form(),




          ],
        ),
      ),
        bottomSheet: buttonValidation(context),
    );
  }

  Widget buttonValidation(BuildContext context){
    // return BlocBuilder<AddCotisationBloc,AddCotisationState>(
    // builder: (contex,state) {
    // if(state is FormAddCotisState)
    // return Container(
    //         height: 75,
    //         padding: EdgeInsets.all(10),
    //         width: double.infinity,
    //         child: ElevatedButton(
    //           style: ButtonStyle(
    //             textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 20)),
    //             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //               RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(30),
    //               )
    //             )
    //           ),
    //           onPressed: (){
    //             if(_formKey.currentState!.validate()){
    //               BlocProvider.of<AddCotisationBloc>(context).add(ValidateAddCotisEvent(state.bus, int.parse(_controller.text.replaceAll(' ','').trim())));
    //               print('go');
    //             }
    //
    //           },
    //           child: Stack(
    //               children:[
    //                 Align(
    //                   alignment: Alignment.center,
    //                   child: Text("Ajouter"),
    //                 ),
    //                 Align(
    //                   alignment: Alignment.centerRight,
    //                   child: BlocBuilder<AddCotisationBloc,AddCotisationState>(
    //                     builder: (context,state){
    //                       print('gogo');
    //                       if(state is FormAddCotisState){
    //                         if(state.loading){
    //                           return CircularProgressIndicator(color: Colors.white,);
    //                         }
    //                       }
    //                       return SizedBox();
    //                     }
    //                   ),
    //                 )
    //               ],
    //           ),
    //         ),
    //      );
    //     else
        return Text('dd');
       //
    // });
  }
  Widget form(){
    return Form(
      key: _formKey,
      child: TextFormField(
          autofocus: true,
        controller: _controller ,
        onChanged: (txt){
          print('test');
        },
        validator: (txt){
            if(txt!.isEmpty){
              return 'Ce champs est obligatoire';
            }
        },
        inputFormatters: [
          // FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          //LengthLimitingTextInputFormatter(3),
          NplSeparatorTextEditing(),

        ],
        style: TextStyle(fontSize: 24),
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          label: Text('montant cotisation'),
        ),
      ),
    );
  }


}
