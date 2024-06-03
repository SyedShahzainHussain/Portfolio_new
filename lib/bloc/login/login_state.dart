part of "login_bloc.dart";

class LoginState extends Equatable {
  final String email;
  final String password;
  final bool isObsecure;
  final String message;
  final PostApiStatus postApiStatus;

  const LoginState({
    this.email = '',
    this.isObsecure = true,
    this.password = '',
    this.message = '',
    this.postApiStatus = PostApiStatus.initial,
  });

  LoginState copyWith({
    String? email,
    String? password,
    bool? isObsecure,
    String? message,
    PostApiStatus? postApiStatus,
  }) {
    return LoginState(
      email: email ?? this.email,
      isObsecure: isObsecure ?? this.isObsecure,
      password: password ?? this.password,
      message: message ?? this.message,
      postApiStatus: postApiStatus ?? this.postApiStatus,
    );
  }

  @override
  List<Object?> get props =>
      [email, password, isObsecure, postApiStatus, message];
}
