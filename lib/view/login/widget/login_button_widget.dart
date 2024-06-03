import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/login/login_bloc.dart';
import 'package:portfolio/utils/enums.dart';

class LoginButtonWidget extends StatelessWidget {
  final Function() clearTeddyAnimation;
  final GlobalKey<FormState> formKey;

  const LoginButtonWidget({
    super.key,
    required this.clearTeddyAnimation,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    save() {
      final validate = formKey.currentState!.validate();
      if (!validate) return;
      if (validate) {
        clearTeddyAnimation();
        context.read<LoginBloc>().add(const LoginButton());
      }
    }

    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return OutlinedButton(
          style: const ButtonStyle(shape: MaterialStatePropertyAll(BeveledRectangleBorder())),
          onPressed: save,
          child: state.postApiStatus == PostApiStatus.loading
              ? const CircularProgressIndicator()
              : const Text("Login"),
        );
      },
    );
  }
}
