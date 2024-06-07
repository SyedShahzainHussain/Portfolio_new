part of 'logout_bloc.dart';

class LogoutState extends Equatable {
  final bool isLogout;

  const LogoutState({this.isLogout = false});

  LogoutState copyWith({bool? isLogout}) {
    return LogoutState(isLogout: isLogout ?? this.isLogout);
  }

  @override
  List<Object?> get props => [isLogout];
}
