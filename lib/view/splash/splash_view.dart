import 'package:flutter/material.dart';

import '../../services/splash/splash_services.dart';

/// A widget representing the splash screen of the application.
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

/// The state of the [SplashView] widget.
class _SplashViewState extends State<SplashView> {
  final SplashServices splashServices =
      SplashServices(); // Instance of SplashServices for handling splash screen logic

  @override
  void initState() {
    super.initState();
    // Calls the [checkAuthentication] method from [SplashServices] to handle authentication logic
    splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
