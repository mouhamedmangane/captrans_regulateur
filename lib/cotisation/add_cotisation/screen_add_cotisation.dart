import 'package:captrans_regulateur/bloc/cotisation/addcotisation/add_cotisation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/bloc/select_widget_by_state.dart';

class ScreenAddCotisation extends StatefulWidget {

   ScreenAddCotisation({Key? key}) : super(key: key);

  @override
  State<ScreenAddCotisation> createState() => _ScreenAddCotisationState();
}

class _ScreenAddCotisationState extends State<ScreenAddCotisation> {


  TextEditingController _controller=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {


    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddCotisationBloc,AddCotisationState>(
           listener: (context,state){

           },
           buildWhen:(previous,current){
             if(previous.runtimeType == current.runtimeType){

                 return false;
             }

             return true;
           },
           builder: (context,state) {
              print(state);
              return
                SelectWidgetByState.selectByBloc<AddCotisationState>(state,[
                ],
                parDefaut: Container());
            },
    );


  }


}


