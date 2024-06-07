import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:universal_html/html.dart' as html;
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
    if (kIsWeb) {
      html.window.sessionStorage['token'] = jsonEncode(user);
      html.window.sessionStorage['isLogin'] = "true";
    } else {
      await localStorage.setValue("token", jsonEncode(user));
      await localStorage.setValue("isLogin", "true");
    }
  }

  Future<void> getUserPrefrences() async {
    try {
      var userData = kIsWeb
          ? html.window.sessionStorage['token']
          : await localStorage.realValue("token");
      var isLogin = kIsWeb
          ? html.window.sessionStorage['isLogin']
          : await localStorage.realValue("isLogin");

      if (userData != null) {
        SessionController().userModel =
            UserModel.fromJson(jsonDecode(userData));
      }
      SessionController().isLogin = isLogin == "true" ? true : false;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> logout() async {
    if (kIsWeb) {
      html.window.sessionStorage.clear();
      await getUserPrefrences();
    } else {
      await localStorage.clearValue("token");
      await localStorage.clearValue("isLogin");
      await getUserPrefrences();
    }
  }
}
