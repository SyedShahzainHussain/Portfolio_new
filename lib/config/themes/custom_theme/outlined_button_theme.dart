import 'package:flutter/material.dart';

import '../../color/colors.dart';

class OutlinedButtonThemes {
  static OutlinedButtonThemeData lightOutlinedButtonTheme(BuildContext context) {
    return OutlinedButtonThemeData(
        style: ButtonStyle(
            side: MaterialStateProperty.all(
                const BorderSide(color: AppColors.primaryColor)),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.hovered)) {
                return AppColors.primaryColor;
              } else if (states.contains(MaterialState.pressed)) {
                return AppColors.primaryColor;
              }
              return null;
            }),
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.hovered)) {
                return Colors.white;
              } else if (states.contains(MaterialState.pressed)) {
                return Colors.white;
              }
              return AppColors.primaryColor;
            }),
            textStyle: MaterialStateProperty.all(
              Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            )));
  }
  static OutlinedButtonThemeData darkOutlinedButtonTheme(BuildContext context) {
    return OutlinedButtonThemeData(
        style: ButtonStyle(
            side: MaterialStateProperty.all(
                const BorderSide(color: AppColors.primaryColor)),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.hovered)) {
                return AppColors.primaryColor;
              } else if (states.contains(MaterialState.pressed)) {
                return AppColors.primaryColor;
              }
              return null;
            }),
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.hovered)) {
                return Colors.white;
              } else if (states.contains(MaterialState.pressed)) {
                return Colors.white;
              }
              return AppColors.primaryColor;
            }),
            textStyle: MaterialStateProperty.all(
              Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            )));
  }
}
