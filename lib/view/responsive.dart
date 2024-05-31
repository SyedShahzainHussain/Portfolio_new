import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  final Widget? tablet;
  final Widget? mobileLarge;
  final Widget? extraMobile;

  const Responsive({
    super.key,
    required this.mobile,
    required this.desktop,
    this.tablet,
    this.mobileLarge,
    this.extraMobile,
  });

  static bool isExtraSmallMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 350;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 500 &&
      MediaQuery.of(context).size.width > 350;

  static bool isMobileLarge(BuildContext context) =>
      MediaQuery.of(context).size.width <= 700 &&
      MediaQuery.of(context).size.width >= 500;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width > 700 &&
      MediaQuery.of(context).size.width < 1024;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width <= 350 && extraMobile != null) {
      return extraMobile!;
    } else if (size.width <= 500) {
      return mobile;
    } else if (size.width >= 1024) {
      return desktop;
    } else if (size.width >= 700 && tablet != null && size.width < 1024) {
      return tablet!;
    } else if (size.width >= 500 && mobileLarge != null && size.width < 700) {
      return mobileLarge!;
    } else {
      return mobile;
    }
  }
}
