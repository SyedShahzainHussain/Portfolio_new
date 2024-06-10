import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/contact_bloc/contact_bloc.dart';
import 'package:portfolio/config/components/loader_widget.dart';
import 'package:portfolio/data/response/response.dart';
import 'package:portfolio/utils/extension/flushbar_extension.dart';

class ContactButton extends StatelessWidget {
  final GlobalKey<FormState> form;

  const ContactButton({super.key, required this.form});

  @override
  Widget build(BuildContext context) {
    save() {
      final validate = form.currentState!.validate();
      if (!validate) return;
      if (validate) {
        context.read<ContactBloc>().add(PostContact());
      }
    }

    return BlocConsumer<ContactBloc, ContactState>(
      listenWhen: (previous, current) =>
          previous.postApiStatus != current.postApiStatus,
      buildWhen: (previous, current) =>
          previous.postApiStatus != current.postApiStatus,
      listener: (context, state) {
        if (state.postApiStatus == PostApiStatus.success) {
          context.flushBarSuccessMessage(message: state.message);
          form.currentState!.reset();
        }
        if (state.postApiStatus == PostApiStatus.error) {
          context.flushBarErrorMessage(message: state.message);
        }
      },
      builder: (context, state) {
        return OutlinedButton(
          style: ButtonStyle(
              shape: WidgetStateProperty.all(const BeveledRectangleBorder())),
          onPressed: () {
            save();
          },
          child: state.postApiStatus == PostApiStatus.loading
              ? const LoaderWidget()
              : const Text("SEND"),
        );
      },
    );
  }
}
