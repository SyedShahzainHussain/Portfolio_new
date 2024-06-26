import 'package:flutter/material.dart';
import 'package:portfolio/admin/view/main/admin_main_screen.dart';
import '../../view/home/home_screen.dart';
import '../../view/main/main_screen.dart';
import '../../view/splash/splash_view.dart';
import 'route_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());

      case RoutesName.main:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MainScreen());

      case RoutesName.adminMainScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const AdminMainScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
