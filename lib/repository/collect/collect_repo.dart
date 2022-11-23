


import '../../model/collect.dart';

abstract class CollectRepo{

  Future<List<Collect>> findLastCollects(int regulateurId);


}