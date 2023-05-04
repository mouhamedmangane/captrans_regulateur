


import 'package:bloc/bloc.dart';
import 'package:captrans_regulateur/service/bluetooth_service.dart';
import 'package:equatable/equatable.dart';

class IsActiveBluetoothBloc extends Bloc<IsActiveBluetoothEvent,bool> {
  final BluetoothService _bluetoothService;

  IsActiveBluetoothBloc({required BluetoothService bluetoothService})
      :
        _bluetoothService=bluetoothService,
        super(false) {
    on<IsActiveBluetoothChange>((event,emit)async{
      print('tessssssssssssssssssssssssssst  ');
      await emit.forEach(
          _bluetoothService.streamIsOnBluetoofh,
          onData: (bool isOn) {
            print('eksiiiiiiiiiiiiiiiiiiiiiiiiiiiii');
            return isOn;
          },
      );

    });

    on<IsActiveBluetoothLoad>(_load);

  }


  Future<void> _load(IsActiveBluetoothLoad event, Emitter<bool> emit) async {
    emit(await _bluetoothService.isOn() ?? false);
  }
}

class IsActiveBluetoothEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
class IsActiveBluetoothLoad extends IsActiveBluetoothEvent{}
class IsActiveBluetoothChange extends IsActiveBluetoothEvent{
}