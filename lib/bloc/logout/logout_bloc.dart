import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/services/session_controller/session_controller.dart';

part 'logout_event.dart';

part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(const LogoutState()) {
    on<Logout>(_logout);
  }

  _logout(Logout event, Emitter<LogoutState> emit) async {
    await SessionController().logout();
    emit(state.copyWith(isLogout: true));
  }
}
