


import 'package:captrans_regulateur/model/bus.dart';
import 'package:captrans_regulateur/model/receveur.dart';

abstract class ReceveurRepo {

  Future<List<Receveur>> get4Recents(Bus bus);
  Future<List<Receveur>> findAll(String text, int page);
  Future<Receveur> save(Receveur receveur);

}