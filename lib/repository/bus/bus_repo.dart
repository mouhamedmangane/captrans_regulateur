import '../../model/bus.dart';

abstract class BusRepo{
  Future<Bus> findBusByMat(String matricule);
  Future<List<Bus>> findAllBus(String text);
}