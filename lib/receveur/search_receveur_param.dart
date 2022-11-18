import 'package:captrans_regulateur/model/receveur.dart';
import 'package:flutter/material.dart';

class SearchReceveurParam{
  final Function(BuildContext,Receveur) onSelect;

  SearchReceveurParam({required this.onSelect});
}