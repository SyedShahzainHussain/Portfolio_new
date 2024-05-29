import 'package:bloc_templates/utils/extension/localization_extension.dart';

import '../../main.dart';
import 'login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc loginBloc;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    loginBloc = LoginBloc(loginRepository: getIt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localization!.login),
      ),
      body: BlocProvider(
        create: (context) => loginBloc,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const EmailFieldWidget(),
                const SizedBox(
                  height: 10,
                ),
                const PasswordFieldWIdget(),
                const SizedBox(
                  height: 10,
                ),
                LoginButtonWidget(
                  formKey: formKey,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
