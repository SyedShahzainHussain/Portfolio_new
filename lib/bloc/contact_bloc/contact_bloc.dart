import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portfolio/data/response/response.dart';
import 'package:portfolio/repository/contact_api/contact_api_repository.dart';
import 'package:portfolio/utils/constant.dart';

part 'contact_state.dart';
part 'contact_event.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactApiRepository contactApiRepository;
  ContactBloc({required this.contactApiRepository})
      : super(const ContactState()) {
    on<YourName>(_yourName);
    on<YourEmail>(_yourEmail);
    on<YourSubject>(_yourSubject);
    on<YourMessage>(_yourMessage);
    on<PostContact>(_postContact);
  }

  _yourName(YourName event, Emitter<ContactState> emit) async {
    emit(state.copyWith(userName: event.name));
  }

  _yourEmail(YourEmail event, Emitter<ContactState> emit) async {
    emit(state.copyWith(userEmail: event.email));
  }

  _yourSubject(YourSubject event, Emitter<ContactState> emit) async {
    emit(state.copyWith(userSubject: event.subject));
  }

  _yourMessage(YourMessage event, Emitter<ContactState> emit) async {
    emit(state.copyWith(userMessage: event.message));
  }

  _postContact(PostContact event, Emitter<ContactState> emit) async {
    emit(state.copyWith(message: "", postApiStatus: PostApiStatus.loading));
    final data = {
      "service_id": serverId,
      "template_id": templatedId,
      "user_id": userId,
      "template_params": {
        "user_name": "Syed Shahzain",
        "user_email": state.userEmail,
        "user_subject": state.userSubject,
        "user_message": state.userMessage,
        "from_name": state.userName,
      }
    };

    await contactApiRepository.sendContactInfo(jsonEncode(data)).then((value) {
      emit(state.copyWith(
          message: "User Details Send to Admin",
          postApiStatus: PostApiStatus.success));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          message: "Error Occured", postApiStatus: PostApiStatus.error));
    });
  }
}
