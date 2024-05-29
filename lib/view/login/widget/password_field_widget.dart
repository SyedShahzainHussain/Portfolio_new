import 'package:bloc_templates/utils/extension/localization_extension.dart';

import '../login.dart';

class PasswordFieldWIdget extends StatelessWidget {
  const PasswordFieldWIdget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.isObsecure != current.isObsecure,
      builder: (context, state) {
        return TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return  context.localization!.passwordRequirements;
            }
            if (value.length < 6) {
              return  context.localization!.passwordShouldbeatleast_characterswithatleastoneletterandnumber;
            }
            return null;
          },
          onChanged: (value) {
            context.read<LoginBloc>().add(PasswordChange(value));
          },
          obscureText: state.isObsecure,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  state.isObsecure ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  context.read<LoginBloc>().add(const PasswordVisibleOrNot());
                },
              ),
              hintText:  context.localization!.password,
              border: const OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(),
              errorBorder: const OutlineInputBorder()),
        );
      },
    );
  }
}
