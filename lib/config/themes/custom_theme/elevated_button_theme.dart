import 'package:flutter/material.dart';
import 'package:portfolio/view/responsive.dart';
import '../../color/colors.dart';

class ElevatedTheme {
  static ElevatedButtonThemeData lightElevatedTheme(BuildContext context) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        surfaceTintColor: const MaterialStatePropertyAll(Colors.white),
        side: MaterialStateProperty.all(
            const BorderSide(color: AppColors.primaryColor)),
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 12.0,
        )),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) {
            return AppColors.primaryColor;
          } else if (states.contains(MaterialState.pressed)) {
            return AppColors.primaryColor;
          }
          return Colors.white;
        }),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) {
            return Colors.white;
          } else if (states.contains(MaterialState.pressed)) {
            return Colors.white;
          }
          return AppColors.primaryColor;
        }),
        textStyle: (Responsive.isMobile(context) ||
                Responsive.isExtraSmallMobile(context))
            ? MaterialStateProperty.all(
                Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              )
            : MaterialStateProperty.all(
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
        surfaceTintColor: const MaterialStatePropertyAll(Colors.white),
        side: MaterialStateProperty.all(
            const BorderSide(color: AppColors.primaryColor)),
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 12.0,
        )),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) {
            return AppColors.primaryColor;
          } else if (states.contains(MaterialState.pressed)) {
            return AppColors.primaryColor;
          }
          return Colors.white;
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
        ),
      ),
    );
  }
}
