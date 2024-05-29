part of "login_bloc.dart";

sealed class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object?> get props => [];
}

class EmailChange extends LoginEvent {
  final String email;
  const EmailChange(this.email);
}

class PasswordChange extends LoginEvent {
  final String password;
  const PasswordChange(this.password);
}

class PasswordVisibleOrNot extends LoginEvent {
  const PasswordVisibleOrNot();
}
class LoginButton extends LoginEvent {
  const LoginButton();
}
