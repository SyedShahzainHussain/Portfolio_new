part of 'contact_bloc.dart';

sealed class ContactEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostContact extends ContactEvent {}

class YourName extends ContactEvent {
  final String name;
  YourName(this.name);
}

class YourEmail extends ContactEvent {
  final String email;
  YourEmail(this.email);
}

class YourSubject extends ContactEvent {
  final String subject;
  YourSubject(this.subject);
}

class YourMessage extends ContactEvent {
  final String message;
  YourMessage(this.message);
}
