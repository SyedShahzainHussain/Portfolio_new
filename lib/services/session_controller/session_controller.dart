import 'dart:convert';

import 'package:flutter/material.dart';

import '../../model/user/user_model.dart';
import '../storage/local_storage.dart';

class SessionController {
  static final SessionController _sessionController =
      SessionController._interval();
  LocalStorage localStorage = LocalStorage();
  UserModel userModel = const UserModel();
  bool? isLogin;

  SessionController._interval() {
    isLogin = false;
  }

  factory SessionController() {
    return _sessionController;
  }

  Future<void> saveUserPrefrence(dynamic user) async {
    await localStorage.setValue("token", jsonEncode(user));
    await localStorage.setValue("isLogin", "true");
  }

  Future<void> getUserPrefrences() async {
    try {
      var userData = await localStorage.realValue("token");
      var isLogin = await localStorage.realValue("isLogin");

      if (userData != null) {
        SessionController().userModel =
            UserModel.fromJson(jsonDecode(userData));
      }
      SessionController().isLogin = isLogin == "true" ? true : false;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
