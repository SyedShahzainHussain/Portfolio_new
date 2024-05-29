import 'package:bloc_templates/utils/extension/flushbar_extension.dart';
import 'package:bloc_templates/utils/extension/localization_extension.dart';
import '../../../config/routes/route_name.dart';
import '../../../utils/enums.dart';
import '../login.dart';

class LoginButtonWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const LoginButtonWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) =>
          previous.postApiStatus != current.postApiStatus,
      listener: (context, state) {
        if (state.postApiStatus == PostApiStatus.success) {
          Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.home, (route) => false);
          context.flushBarSuccessMessage(message: state.message);
        } else if (state.postApiStatus == PostApiStatus.error) {
          context.flushBarErrorMessage(message: state.message);
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) =>
            previous.postApiStatus != current.postApiStatus,
        builder: (context, state) {
          return SizedBox(
              width: double.infinity,
              child: RoundButton(
                loading: state.postApiStatus == PostApiStatus.loading,
                title: context.localization!.login,
                onPress: () {
                  if (formKey.currentState!.validate()) {
                    context.read<LoginBloc>().add(const LoginButton());
                  }
                },
              ));
        },
      ),
    );
  }
}
