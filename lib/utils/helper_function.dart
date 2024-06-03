import 'package:flutter/material.dart';

class HelperFunction {
  static bool isDarkMode(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return isDarkMode;
  }
}
