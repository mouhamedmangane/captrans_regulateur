
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

enum HomeTab{ cotisation,collect,bus}

class HomeState extends Equatable{
  final HomeTab tab;
  const HomeState({
    this.tab=HomeTab.cotisation,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [tab];
}

class HomeCubit extends Cubit<HomeState>{
  HomeCubit():super(const HomeState());

  void setTab(HomeTab tab) => emit(HomeState(tab: tab));

}