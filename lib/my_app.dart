import 'package:captrans_regulateur/bloc/home_cubit.dart';
import 'package:captrans_regulateur/bus/bus_body.dart';
import 'package:captrans_regulateur/collect/collect_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cotisation/cotisation_home/cotisation_body.dart';

class MyHomePage extends StatelessWidget {
  static const String  routeName="/home";
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
        create:(_)=> HomeCubit(),
        child: MyHomeView(),
    );
  }
}


class MyHomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final selectedTab=context.select((HomeCubit cubit)=> cubit.state.tab);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: IndexedStack(
        index: selectedTab.index ,
        children: const [CotisationBody(),CollectBody(),BusBody()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 1,
        //enableFeedback: false,
        currentIndex: selectedTab.index,
        onTap: (selected){
         context.read<HomeCubit>().setTab(HomeTab.values[selected]);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.payments),
            label: "Cotisations",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2,),
            label: "Collectes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus),
            label: "Bus",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Paramètre",
            backgroundColor:Colors.blue,
          ),

      ],
    ),

    );
  }
}
