import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio/bloc/drawer_change_bloc/drawer_change_bloc.dart';
import 'package:portfolio/bloc/logout/logout_bloc.dart';
import 'package:portfolio/config/builder_context/builder_context.dart';
import 'package:portfolio/config/themes/custom_theme/elevated_button_theme.dart';
import 'package:portfolio/config/themes/custom_theme/outlined_button_theme.dart';
import 'package:portfolio/config/themes/theme.dart';
import 'package:portfolio/repository/contact_api/contact_api_repository.dart';
import 'package:portfolio/repository/contact_api/contact_repository.dart';
import 'package:rive/rive.dart';
import 'config/routes/route_name.dart';
import 'config/routes/routes.dart';
import 'repository/auth_api/auth_repository.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensuring that Flutter bindings are initialized

  await RiveFile.initialize();

  servicesLocator(); // Initializing service locator for dependency injection

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => DrawerChangeBloc(),
      ),
      BlocProvider(
        create: (context) => LogoutBloc(),
      ),
    ],
    child: const MyApp(),
  ));
}

// GetIt is a package used for service locator or to manage dependency injection
GetIt getIt = GetIt.instance;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return MaterialApp(
        navigatorKey: BuilderContext.navigatorKey,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'), // English
          Locale('es'), // Spanish
        ],
        title: 'Portfolio',
        debugShowCheckedModeBanner: false,
        locale: const Locale('en'),
        themeMode: ThemeMode.system,
        darkTheme: Themes.darkTheme.copyWith(
          elevatedButtonTheme: ElevatedTheme.darkElevatedTheme(context),
          outlinedButtonTheme:
              OutlinedButtonThemes.darkOutlinedButtonTheme(context),
        ),
        theme: Themes.lightTheme.copyWith(
          elevatedButtonTheme: ElevatedTheme.lightElevatedTheme(context),
          outlinedButtonTheme:
              OutlinedButtonThemes.lightOutlinedButtonTheme(context),
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      );
    });
  }
}

// Function for initializing service locator
void servicesLocator() {
  getIt.registerLazySingleton<AuthApiRepository>(() =>
      AuthHttpApiRepository()); // Registering AuthHttpApiRepository as a lazy singleton for AuthApiRepository

  getIt.registerLazySingleton<ContactApiRepository>(() =>
      ContactHttpRepository()); // Registering ContactHttpApiRepository as a lazy singleton for ContactApiRepository
}
