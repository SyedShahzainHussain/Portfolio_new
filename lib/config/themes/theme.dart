import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../color/colors.dart';

class Themes {
  static BuildContext? context;
  Themes(BuildContext context) {
    context = context;
  }
  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(color: AppColors.bgColor),
    brightness: Brightness.light,
    textTheme: GoogleFonts.ubuntuCondensedTextTheme(),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.bgColor,
      textTheme: GoogleFonts.ubuntuCondensedTextTheme());
}
