
import 'package:equatable/equatable.dart';

import '../../model/user.dart';

enum ParametreStatus{init,loading,success,error}
class ParametreState extends Equatable{
  final User? user;
  final ParametreStatus status;
  ParametreState({
    User ? user,
    ParametreStatus ? status,
}):
  user=user,
  status=status ?? ParametreStatus.init
  ;

  ParametreState copyWith({
    ParametreStatus ? status,
    User ? user,
  }) {
   return ParametreState(
    user: user?? this.user,
    status: status ?? this.status,
  );
 }

  @override
  // TODO: implement props
  List<Object?> get props => [status,user];
}