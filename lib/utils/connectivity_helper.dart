import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

class ConnectivityHelper {
  final Connectivity connectivity = Connectivity();

  Future<bool> isConnected() async {
    try {
      final result = await connectivity.checkConnectivity();
      if (result.contains(ConnectivityResult.none)) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }
}
