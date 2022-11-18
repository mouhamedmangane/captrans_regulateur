

part of 'receveur_search_bloc.dart';

class ReceveurSearchEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class ReceveurSearchLoad extends ReceveurSearchEvent{
  String search;
  ReceveurSearchLoad({required this.search});
  List<Object?> get props => [search];
}

class ReceveurSearchOnAdded extends ReceveurSearchEvent{
}


