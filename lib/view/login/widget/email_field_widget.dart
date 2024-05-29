import 'package:bloc_templates/utils/extension/localization_extension.dart';
import 'package:bloc_templates/utils/extension/validations_extension.dart';

import '../login.dart';

class EmailFieldWidget extends StatelessWidget {
  const EmailFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return context.localization!.pleaseEnsureTheEmailEnteredIsValid;
            }
            if (value.emailValidator()) {
              return context
                  .localization!.aCompleteValidEmailExamplejoegmailcom;
            }
            return null;
          },
          onChanged: (value) {
            context.read<LoginBloc>().add(EmailChange(value));
          },
          decoration:  InputDecoration(
              hintText:  context.localization!.email,
              border: const OutlineInputBorder(),
              focusedBorder: const OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(),
              errorBorder: const OutlineInputBorder()),
        );
      },
    );
  }
}
