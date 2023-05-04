import 'dart:async';

import 'package:blue_thermal_printer/blue_thermal_printer.dart';


class PrintService{



  PrintService( ){

  }










 Future<bool> connectAndTest(BluetoothDevice device) async {
     bool test=false;
       print('device not null');
       BlueThermalPrinter _bluetooth = BlueThermalPrinter.instance;
       await _bluetooth.isConnected.then((isConnected)async {
         //await _bluetooth.connect(device).catchError((onError){});

         print('bluetooth is $isConnected');
        if (isConnected == true) {

            print('device is connected');
            _bluetooth.printNewLine();
            _bluetooth.printCustom("HEADER", 3, 1);
            _bluetooth.printNewLine();
            //_bluetooth.printImage(pathImage); //path of your image/logo
            _bluetooth.printNewLine();
            // _bluetooth.printImageBytes(bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes));
            _bluetooth.printLeftRight("LEFT", "RIGHT", 0);
            _bluetooth.printLeftRight("LEFT", "RIGHT", 1);
            _bluetooth.printLeftRight(
                "LEFT", "RIGHT", 1, format: "%-15s %15s %n");
            _bluetooth.printNewLine();
            _bluetooth.printLeftRight("LEFT", "RIGHT", 2);
            _bluetooth.printLeftRight("LEFT", "RIGHT", 3);
            _bluetooth.printLeftRight("LEFT", "RIGHT", 4);
            _bluetooth.printNewLine();
            _bluetooth.print3Column("Col1", "Col2", "Col3", 1);
            _bluetooth.print3Column("Col1", "Col2", "Col3", 1,
                format: "%-10s %10s %10s %n");
            _bluetooth.printNewLine();
            _bluetooth.print4Column("Col1", "Col2", "Col3", "Col4", 1);
            _bluetooth.print4Column("Col1", "Col2", "Col3", "Col4", 1,
                format: "%-8s %7s %7s %7s %n");
            _bluetooth.printNewLine();
            String testString = " čĆžŽšŠ-H-ščđ";
            _bluetooth.printCustom(testString, 1, 1, charset: "windows-1250");
            _bluetooth.printLeftRight("Številka:", "18000001", 1,
                charset: "windows-1250");
            _bluetooth.printCustom("Body left", 1, 0);
            _bluetooth.printCustom("Body right", 0, 2);
            _bluetooth.printNewLine();
            _bluetooth.printCustom("Thank You", 2, 1);
            _bluetooth.printNewLine();
            _bluetooth.printQRcode(
                "Insert Your Own Text to Generate", 200, 200, 1);
            _bluetooth.printNewLine();
            _bluetooth.printNewLine();
            _bluetooth.paperCut();
          test = true;

        }

      });


    return test;
  }






}