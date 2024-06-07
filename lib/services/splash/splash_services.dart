import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/view/main/main_screen.dart';
import 'package:portfolio/admin/view/main/admin_main_screen.dart';
import '../session_controller/session_controller.dart';

class SplashServices {
  void checkAuthentication(BuildContext context) async {
    await SessionController().getUserPrefrences().then((value) {
      if (kDebugMode) {
        SessionController().isLogin;
      }
      if (SessionController().isLogin ?? false) {
        Timer(const Duration(seconds: 3), () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const AdminMainScreen()),
              (route) => false);
        });
      } else {
        Timer(const Duration(seconds: 3), () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const MainScreen()),
              (route) => false);
        });
      }
    });
  }
}
