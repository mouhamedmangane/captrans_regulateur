import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:captrans_regulateur/bloc/print/Is_active_bluetooth_bloc.dart';
import 'package:captrans_regulateur/bloc/print/selected_device_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noppal_util/ui/croquis/card_croquis.dart';
import 'package:noppal_util/ui/croquis/list_croquis.dart';

import '../service/bluetooth_service.dart';
import '../bloc/print/list_device_bloc.dart';

class PrintPage extends StatelessWidget {


  static const String routeName='print/list';

  const PrintPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers:[
          BlocProvider<IsActiveBluetoothBloc>(
            create: (context) => IsActiveBluetoothBloc(bluetoothService: context.read<BluetoothService>())..add(IsActiveBluetoothLoad())..add(IsActiveBluetoothChange()),
          ),
          BlocProvider<ListDeviceBloc>(
            create: (context) => ListDeviceBloc(bluetoothService: context.read<BluetoothService>())..add(ListDeviceChangeDevice()),
          ),
          BlocProvider<SelectedDeviceBloc>(
            create: (context)=>SelectedDeviceBloc(bluetoothService: context.read<BluetoothService>())..add(SelectedDeviceLoad())..add(SelectedDeviceConnected()),
          )
        ] ,
        child: PrintView(),
    );
  }


}

class PrintView extends StatelessWidget {
  const PrintView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Serice Impression'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<SelectedDeviceBloc,SelectedDeviceState>(
              builder: (context,state){
                if(state.status== SelectedDeviceStatus.loading){
                  return _selectedDeviceLoading();
                }
                else if(state.bluetoothDevice==null){
                  return _selectedDeviceEmpty();
                }
                else{
                  return _selectedDeviceDone(context, state);
                }
              }
            ),
            BlocBuilder<IsActiveBluetoothBloc,bool>(
                builder:(context,state){
                  if(!state){
                    return Container(
                        child:Text('Le Bluetooth est desactié')
                    );
                  }
                  else{
                    return Container();
                  }
                }
            )
          ],
        ),

      ),
      bottomSheet: Container(height: 100,),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:_actionButton(context),



    );
  }

  Widget _actionButton(BuildContext context){
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [BlocBuilder<SelectedDeviceBloc,SelectedDeviceState>(
        builder: (context,state){
          if(state.status== SelectedDeviceStatus.loading || state.status == SelectedDeviceStatus.faillure){
            return Container();
          }
          else if(state.bluetoothDevice==null){
            return FloatingActionButton(
              onPressed: (){
                // context.read<BluetoothService>(). streamContollerisOn.add(true);
                _showMyDialog(
                    context,
                    BlocProvider.of<ListDeviceBloc>(context),
                    BlocProvider.of<IsActiveBluetoothBloc>(context)
                );

              },
              child: Icon(Icons.add),
            );
          }
          else{
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.extended(
                  onPressed: (){
                    _showMyDialog(
                        context,
                        BlocProvider.of<ListDeviceBloc>(context),
                        BlocProvider.of<IsActiveBluetoothBloc>(context)
                    );
                  },
                  label: Row(
                    children: [
                      Icon(Icons.edit),
                      SizedBox(width: 5,),
                      Text('Changer')
                    ],
                  ),
                ),
                SizedBox(width: 10,),
                FloatingActionButton.extended(
                  onPressed: (){

                  },
                  label: Row(
                    children: [
                      Icon(Icons.print_outlined),
                      SizedBox(width: 5,),
                      Text('Tester  ')
                    ],
                  ),
                  //child:,
                )
              ],
            );
          }
        }
    ),
        ],
    );
  }

  Widget _selectedDeviceLoading(){
    return Column(
      children: [
        CardCroquis(
          width: 200,
          height: 200,
        ),
        SizedBox(height: 15,),
        CardCroquis(width: double.infinity, height: 50),
      ],
    );
  }

  Widget _selectedDeviceEmpty(){
    return Column(
      children: [
        Icon(Icons.add,size: 80,),
        SizedBox(height: 15,),
        Text('Aucun Periphérique est enregistré'),
        Text('Veillez ajouter un nouveau imprimante en cliquant sur le bouton ajout')
      ],
    );
  }

  Widget _selectedDeviceDone(BuildContext context,SelectedDeviceState state){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon((state.isConnected)?Icons.print:Icons.print_disabled_outlined,size: 120,color: Colors.grey),
        SizedBox(height: 10,),
        Text(state.bluetoothDevice!.name ?? "Non défini",style: const  TextStyle(fontWeight: FontWeight.bold,fontSize: 24)),
        SizedBox(height: 10,),
        Text(state.bluetoothDevice!.address ?? "Non défini",style: const  TextStyle(fontSize: 20)),
        SizedBox(height: 15,),
        ListTile(
          leading:Icon((state.isConnected)?Icons.bluetooth_connected:Icons.bluetooth_disabled,),
          title: const Text("Etat du peripherique ",),
          trailing: Switch(
            value: state.isConnected,
            onChanged: (reponse){
              print('rrrrrrrrrrrrrrrrrrrrrrrrrrrrr $reponse');
              context.read<SelectedDeviceBloc>().add(SelectedDeviceChangeConnect(!reponse));
            },
          ),
        ),
        SizedBox(height: 100,),
      ],
    );
  }

  Future<void> _showMyDialog(BuildContext context,ListDeviceBloc listDeviceBloc,IsActiveBluetoothBloc isActiveBluetoothBloc) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(15),
          title: const Text('Selectionner l\imprimante'),
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          content:MultiBlocProvider(
            providers: [
              BlocProvider<IsActiveBluetoothBloc>.value(value:isActiveBluetoothBloc),
              BlocProvider<ListDeviceBloc>.value(value:listDeviceBloc..add(ListDeviceLoad())),
            ],
            child: BlocBuilder<IsActiveBluetoothBloc,bool>(
              builder: (context,state){
                if(state){
                  return _listDevice();
                }
                else{
                  return Text('le bluetooth est inactif, veuillez l\'activer');
                }
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Fermer'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],

        );
      },
    );
  }

  Widget _listDevice(){
    return BlocBuilder<ListDeviceBloc,ListDeviceState>(
      builder: (context,state){
        if(state.status == ListDeviceStatus.init){
          return Container();
        }
        if(state.status==ListDeviceStatus.loading){
            return ListCroquisSliver(5);
        }
        else if(state.status == ListDeviceStatus.failled) {
          return Container(
            width: double.infinity,
            height: 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(state.message!),
          );
        }
        else if(state.devices==null){
          return Text('Liste vide',style: TextStyle(color: Colors.grey));
        }
        else{
          return ListView.builder(
            //separatorBuilder: (context,index)=>Divider(),
              itemBuilder:(BuildContext context,int index){
                 return DeviceTile(
                     device: state.devices![index],
                   onPressed: (){
                       context.read<BluetoothService>().saveDevice(state.devices![index]);
                   },
                 );
              },
              itemCount: state.devices!.length,
          );
        }
      },
    );
  }

}



class DeviceTile extends StatelessWidget {
  final BluetoothDevice device;
  final Function() ? onPressed;
  const DeviceTile({required this.device, this.onPressed,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      minVerticalPadding: 0,

      title: Text(device.name??'Aucun nom'),
      subtitle: Text(device.address??'Aucun adresse'),
      //leading: Text('${device.type}'),
      trailing: CircleAvatar(radius: 5,backgroundColor: device.connected ? Colors.green : Colors.red,),
      onTap:onPressed,
    );
  }
}

