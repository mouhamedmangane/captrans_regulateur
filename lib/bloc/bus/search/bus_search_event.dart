

part of 'bus_search_bloc.dart';

class BusSearchEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class BusSearchLoad extends BusSearchEvent{
  final String search;
  BusSearchLoad({required this.search});

  @override
  List<Object?> get props => [search];
}

class BusSearchOnAdded extends BusSearchEvent{
}


