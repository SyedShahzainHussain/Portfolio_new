import 'package:flutter/material.dart';
import 'package:portfolio/view/responsive.dart';
import '../../color/colors.dart';

class ElevatedTheme {
  static ElevatedButtonThemeData lightElevatedTheme(BuildContext context) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        surfaceTintColor: const WidgetStatePropertyAll(Colors.white),
        side: WidgetStateProperty.all(
            const BorderSide(color: AppColors.primaryColor)),
        padding: WidgetStateProperty.all(const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 12.0,
        )),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) {
            return AppColors.primaryColor;
          } else if (states.contains(WidgetState.pressed)) {
            return AppColors.primaryColor;
          }
          return Colors.white;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) {
            return Colors.white;
          } else if (states.contains(WidgetState.pressed)) {
            return Colors.white;
          }
          return AppColors.primaryColor;
        }),
        textStyle: (Responsive.isMobile(context) ||
                Responsive.isExtraSmallMobile(context))
            ? WidgetStateProperty.all(
                Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              )
            : WidgetStateProperty.all(
                Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
      ),
    );
  }

  static ElevatedButtonThemeData darkElevatedTheme(BuildContext context) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        surfaceTintColor: const WidgetStatePropertyAll(Colors.white),
        side: WidgetStateProperty.all(
            const BorderSide(color: AppColors.primaryColor)),
        padding: WidgetStateProperty.all(const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 12.0,
        )),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) {
            return AppColors.primaryColor;
          } else if (states.contains(WidgetState.pressed)) {
            return AppColors.primaryColor;
          }
          return Colors.white;
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
        ),
      ),
    );
  }
}
