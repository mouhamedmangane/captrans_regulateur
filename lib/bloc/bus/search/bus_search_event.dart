

part of 'bus_search_bloc.dart';

class BusSearchEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class BusSearchLoad extends BusSearchEvent{
  String search;
  BusSearchLoad({required this.search});
  List<Object?> get props => [search];
}

class BusSearchOnAdded extends BusSearchEvent{
}


