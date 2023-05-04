

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:captrans_regulateur/service/bluetooth_service.dart';
import 'package:equatable/equatable.dart';

class ListDeviceBloc extends Bloc<ListDeviceEvent,ListDeviceState>{
  final  BluetoothService _bluetoothService;
  ListDeviceBloc({required BluetoothService bluetoothService}):
  _bluetoothService=bluetoothService,
  super(const ListDeviceState()){
      on<ListDeviceLoad>(_onLoad);
      on<ListDeviceChangeDevice>((event,emit) async{
        await emit.forEach(_bluetoothService.streamActiveDevice, onData: (BluetoothDevice onData){
            return state.copyWith(selectedDevice: onData);
        });
      },transformer:restartable());
  }



  Future<void> _onLoad(ListDeviceLoad event,Emitter<ListDeviceState> emit) async{
    emit(state.copyWith(status:ListDeviceStatus.loading,devices: null,selectedDevice: event.device));
    await _bluetoothService.listDevices().then((value){
      emit(state.copyWith(status:ListDeviceStatus.done,devices: value));
    }).catchError((error){
      emit(state.copyWith(status:ListDeviceStatus.failled,message: error.toString()));
    });
  }


}


//Event

class ListDeviceEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class ListDeviceLoad extends ListDeviceEvent{
  final BluetoothDevice ? device;
  ListDeviceLoad({this.device});
  @override
  List<Object?> get props => [device];
}

class ListDeviceChangeDevice extends ListDeviceEvent{
}


//State

enum ListDeviceStatus{init,loading,failled,done}

class ListDeviceState extends Equatable{
  final ListDeviceStatus status;
  final bool isOnBluetooth;
  final List <BluetoothDevice> ? devices;
  final BluetoothDevice ? selectedDevice;
  final String ? message;

  const ListDeviceState({
    this.status=ListDeviceStatus.init,
    this.selectedDevice,
    this.devices,
    this.message,
    this.isOnBluetooth=false,
  });

  ListDeviceState copyWith({
  ListDeviceStatus ? status,
    List<BluetoothDevice> ? devices,
    BluetoothDevice ? selectedDevice,
    String ? message,
    bool ? isOnBluetooth,
}) => ListDeviceState(
    status:status ?? this.status,
    devices: devices ?? this.devices,
    selectedDevice: selectedDevice ?? this.selectedDevice,
    message: message ?? this.message,
    isOnBluetooth: isOnBluetooth ?? this.isOnBluetooth
  );

  @override
  List<Object?> get props => [status,devices,selectedDevice,message,isOnBluetooth];
}