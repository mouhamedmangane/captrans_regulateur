import 'package:captrans_regulateur/bloc/cotisation/total_cotisation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';
import 'package:noppal_util/format/number_helper.dart';

class TotalCotisationCard extends StatelessWidget {
  const TotalCotisationCard ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 0,vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).primaryColor,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              child: Image.asset("asset/images/money1.png",width: 85,),
              alignment: Alignment.centerRight,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  BlocBuilder<TotalCotisationBloc,SimpleLoadableState<int>>(
                    builder: (context,state) {
                      return Text("${NumberHelper.format(state.value??0)} FCFA",style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.bold),);
                    }
                  ),
                  SizedBox(height: 3,),
                  Text("Montant Encaissé",style: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold),),
                  //Text("FCFA",style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.bold),),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
