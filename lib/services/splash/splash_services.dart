import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../config/routes/route_name.dart';
import '../session_controller/session_controller.dart';

class SplashServices {
  void checkAuthentication(BuildContext context) {
    SessionController().getUserPrefrences().then((value) {
      if (kDebugMode) {
        SessionController().isLogin;
      }
      if (SessionController().isLogin ?? false) {
        Timer(
          const Duration(seconds: 3),
          () {
            Navigator.pushNamedAndRemoveUntil(
                context, RoutesName.home, (route) => false);
          },
        );
      } else {
        Timer(
          const Duration(seconds: 3),
          () {
            Navigator.pushNamedAndRemoveUntil(
                context, RoutesName.login, (route) => false);
          },
        );
      }
    }).onError((error, stackTrace) {
      Timer(
        const Duration(seconds: 3),
        () {
          Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.login, (route) => false);
        },
      );
    });
  }
}
