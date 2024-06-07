part of 'contact_bloc.dart';

class ContactState extends Equatable {
  final PostApiStatus postApiStatus;
  final String message;
  final String userName;
  final String userEmail;
  final String userSubject;
  final String userMessage;

  const ContactState({
    this.message = "",
    this.postApiStatus = PostApiStatus.initial,
    this.userEmail = "",
    this.userMessage = "",
    this.userName = "",
    this.userSubject = "",
  });

  ContactState copyWith({
    PostApiStatus? postApiStatus,
    String? message,
    String? userName,
    String? userEmail,
    String? userSubject,
    String? userMessage,
  }) {
    return ContactState(
      message: message ?? this.message,
      postApiStatus: postApiStatus ?? this.postApiStatus,
      userEmail: userEmail ?? this.userEmail,
      userMessage: userMessage ?? this.userMessage,
      userName: userName ?? this.userName,
      userSubject: userSubject ?? this.userSubject,
    );
  }

  @override
  List<Object?> get props =>
      [message, postApiStatus, userName, userEmail, userMessage, userSubject];
}
