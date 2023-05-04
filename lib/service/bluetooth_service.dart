

import 'dart:async';

import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:noppal_util/repository/local_repo_object_item.dart';
import 'package:noppal_util/repository/local_reposiroty.dart';

class BluetoothService  extends NplLocalReposiroty{

  BlueThermalPrinter _bluetooth = BlueThermalPrinter.instance;
  late final StreamController<bool> _streamContollerisConnect;
  late final StreamController<bool> _streamContollerisOn;
  late final StreamController<BluetoothDevice> _streamContollerDevice;

  late final Stream<bool> streamIsConnectedDevice;
  late final Stream<bool> streamIsOnBluetoofh;
  late final Stream<BluetoothDevice> streamActiveDevice;

  late final LocalRepoObjectItem<BluetoothDevice?> _localRepoDevice;



  BluetoothService():super('print'){
    _localRepoDevice=LocalRepoObjectItem<BluetoothDevice>(
      key:"print_devices",
      create:(map) =>BluetoothDevice.fromMap(map),
      toJson: (value)=>value!.toMap(),
    );
    _streamContollerisOn=StreamController<bool>();
    _streamContollerisConnect=StreamController<bool>();
    _streamContollerDevice=StreamController<BluetoothDevice>();
    streamIsConnectedDevice =  _streamContollerisConnect.stream.asBroadcastStream();
    streamIsOnBluetoofh =  _streamContollerisOn.stream.asBroadcastStream();
    streamActiveDevice =  _streamContollerDevice.stream.asBroadcastStream();
    initBluetooth();
    print('bluetooth iniiiiiiiiiiiiiiiiiiiiiiiiiiiiiit');
  }



  void initBluetooth(){
    _bluetooth.onStateChanged().listen((state) async{
      print('hassssssssssssssssssssssssssssss listenar ${_streamContollerisOn.hasListener}  ');


      switch (state) {
        case BlueThermalPrinter.CONNECTED:
          print("actiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiive connected");
          _streamContollerisOn.add(true);

          break;
        case BlueThermalPrinter.DISCONNECTED:
          print("actiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiive discnnected");
          _streamContollerisOn.add(true);
          break;
        case BlueThermalPrinter.DISCONNECT_REQUESTED:
          print("actiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiive disconnect requested");
          _streamContollerisOn.add(true);
          break;
        case BlueThermalPrinter.STATE_TURNING_OFF:
          print("actiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiive state_turning off");
          _streamContollerisOn.add(true);
          break;
        case BlueThermalPrinter.STATE_OFF:
          print("desssssssssssactiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiive state off");
          _streamContollerisOn.add(false);
          break;
        case BlueThermalPrinter.STATE_ON:
          print("actiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiive state on");
          _streamContollerisOn.add(true);
          break;
        case BlueThermalPrinter.STATE_TURNING_ON:
          print("desssssssssssactiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiive turning off");
          _streamContollerisOn.add(false);
          break;
        case BlueThermalPrinter.ERROR:
          print("ererrrrrracccccccccctdesssssssssssactiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiive errer");

          _streamContollerisOn.add(false);
          break;
        default:
          print(state);
          break;
      }
    });
  }

  Future<bool?> isOn()async{
    return await _bluetooth.isOn;
  }


  void connect(BluetoothDevice   device) async{
    print('connextionnnnnnnnnnng');
    _bluetooth.isConnected.then((isConnected) {
      print('connect prepare Conecctiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiing');
        if(isConnected??false){
          print('connect isConecctiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiing');
          _bluetooth.isDeviceConnected(device).then((value){
            print('connect ouiiiiiiiiiiiiii     isConecctiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiing');
            _streamContollerisConnect.add(true);
          }).catchError((err){
            print('connect nonnnnnnnnnn isConecctiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiing');

            _streamContollerisConnect.add(false);
            throw err;
          });
        }
        else{
          _bluetooth.connect(device).then((isConnected){
            _streamContollerisConnect.add(isConnected);
          }).catchError((error) {
            _streamContollerisConnect.add(false);
            throw error;
          });
        }



    });
  }

  void disconnect() async{
    print('disssconnextionnnnnnnnnnng');
    await _bluetooth.disconnect();
    _streamContollerisConnect.add(false);
  }



  Future<void> saveDevice(BluetoothDevice bluetoothDevice) async{
    set(_localRepoDevice, bluetoothDevice);
    _streamContollerDevice.add(bluetoothDevice);
  }

  Future<BluetoothDevice?> getDevice() async{
    BluetoothDevice ? device;
    await get(_localRepoDevice).then((value) => device=value).catchError((errr) {
      device = null;
    });
    return device;
  }

  Future<List<BluetoothDevice>> listDevices()async{
    return await _bluetooth.getBondedDevices();
  }






}