
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:captrans_regulateur/service/bluetooth_service.dart';
import 'package:equatable/equatable.dart';

class SelectedDeviceBloc extends Bloc<SelectedDeviceEvent,SelectedDeviceState>{
  final BluetoothService _bluetoothService;
  SelectedDeviceBloc({required BluetoothService bluetoothService}):
        _bluetoothService=bluetoothService,
        super(const SelectedDeviceState()){
    on<SelectedDeviceLoad>(_load);
    on<SelectedDeviceChanged>((event,emit)async{
      await emit.forEach(
          _bluetoothService.streamActiveDevice,
          onData:(BluetoothDevice device){
            return state.copyWith(status:SelectedDeviceStatus.done,bluetoothDevice: device);
          }
      );
    },transformer:droppable());
    on<SelectedDeviceConnected>((event,emit)async{
      await emit.forEach(
          _bluetoothService.streamIsConnectedDevice,
          onData: (bool isConnected){
            print('isdddddddddddddddddddddddddddddddd');
            return state.copyWith(isConnected: isConnected);
          }
      );


    },transformer:concurrent());
    on<SelectedDeviceChangeConnect>(_changeConnection);
  }



  Future<void> _load(SelectedDeviceLoad event,Emitter<SelectedDeviceState> emit) async{
    BluetoothDevice ? device=await _bluetoothService.getDevice();
    if(device!=null){
      _bluetoothService.connect(device);
    }
    emit(state.copyWith(status:SelectedDeviceStatus.done,bluetoothDevice: device));
  }

  Future<void> _changeConnection(SelectedDeviceChangeConnect event,Emitter<SelectedDeviceState>emit) async{
   print('changiiiiiiiiiiiiiing');
    if(!event.isConnected){
      _bluetoothService.connect(state.bluetoothDevice!);
    }
    else {
      _bluetoothService.disconnect();
    }
  }



}


class SelectedDeviceEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class SelectedDeviceLoad extends SelectedDeviceEvent{}

class SelectedDeviceSave extends SelectedDeviceEvent{
  final BluetoothDevice device;
  SelectedDeviceSave(this.device);
  @override
  List<Object?> get props => [device];
}

class SelectedDeviceChanged extends SelectedDeviceEvent{}

class SelectedDeviceChangeConnect extends SelectedDeviceEvent{
  final bool isConnected;
  SelectedDeviceChangeConnect(this.isConnected);
  @override
  List<Object?> get props => [isConnected];
}

class SelectedDeviceConnected extends SelectedDeviceEvent{}



enum SelectedDeviceStatus{loading,done,faillure}
class SelectedDeviceState extends Equatable{
  final SelectedDeviceStatus status;
  final BluetoothDevice ? bluetoothDevice;
  final bool isConnected;
  final String  message;

  const SelectedDeviceState({
    this.status=SelectedDeviceStatus.loading,
    this.bluetoothDevice,
    this.isConnected=false,
    this.message="",
  });

  SelectedDeviceState copyWith({
    SelectedDeviceStatus ? status,
    BluetoothDevice ? bluetoothDevice,
    bool  ? isConnected,
    String ? message,
  })=>SelectedDeviceState(
    status: status ?? this.status,
    bluetoothDevice: bluetoothDevice ?? this.bluetoothDevice,
    isConnected: isConnected ?? this.isConnected,
    message: message ?? this.message,
  );

  @override
  List<Object?> get props => [status,bluetoothDevice,isConnected,message];
}