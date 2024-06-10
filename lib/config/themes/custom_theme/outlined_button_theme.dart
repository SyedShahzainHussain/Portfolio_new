import 'package:flutter/material.dart';

import '../../color/colors.dart';

class OutlinedButtonThemes {
  static OutlinedButtonThemeData lightOutlinedButtonTheme(BuildContext context) {
    return OutlinedButtonThemeData(
        style: ButtonStyle(
            side: WidgetStateProperty.all(
                const BorderSide(color: AppColors.primaryColor)),
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.hovered)) {
                return AppColors.primaryColor;
              } else if (states.contains(WidgetState.pressed)) {
                return AppColors.primaryColor;
              }
              return null;
            }),
            foregroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.hovered)) {
                return Colors.white;
              } else if (states.contains(WidgetState.pressed)) {
                return Colors.white;
              }
              return AppColors.primaryColor;
            }),
            textStyle: WidgetStateProperty.all(
              Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            )));
  }
  static OutlinedButtonThemeData darkOutlinedButtonTheme(BuildContext context) {
    return OutlinedButtonThemeData(
        style: ButtonStyle(
            side: WidgetStateProperty.all(
                const BorderSide(color: AppColors.primaryColor)),
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.hovered)) {
                return AppColors.primaryColor;
              } else if (states.contains(WidgetState.pressed)) {
                return AppColors.primaryColor;
              }
              return null;
            }),
            foregroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.hovered)) {
                return Colors.white;
              } else if (states.contains(WidgetState.pressed)) {
                return Colors.white;
              }
              return AppColors.primaryColor;
            }),
            textStyle: WidgetStateProperty.all(
              Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            )));
  }
}
