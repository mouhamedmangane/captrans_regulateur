import 'package:captrans_regulateur/model/bus.dart';
import 'package:flutter/material.dart';

class SearchBusParam{
  final Function(BuildContext,Bus) onSelect;

  SearchBusParam({required this.onSelect});
}