import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/login/login_bloc.dart';
import 'package:portfolio/main.dart';
import 'package:portfolio/utils/extension/general_extension.dart';
import 'package:portfolio/view/responsive.dart';

import 'widget/login_form_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc loginBloc;

  @override
  void initState() {
    super.initState();
    loginBloc = LoginBloc(loginRepository: getIt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => loginBloc,
        child: Center(
          child: SizedBox(
            width: kIsWeb
                ? (Responsive.isDesktop(context) ||
                        Responsive.isTablet(context))
                    ? context.mediaQueryWidth / 2
                    : null
                : context.mediaQueryWidth * 0.90,
            child: SingleChildScrollView(
              child: Material(
                elevation: 8.0,
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  color: Colors.white,
                  child: const LoginForm(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
