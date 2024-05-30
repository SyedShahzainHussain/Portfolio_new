import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  final Widget? mobileLarge;
  final Widget? tablet;

  const Responsive({
    super.key,
    required this.mobile,
    required this.desktop,
    this.tablet,
    this.mobileLarge,
  });


  static bool isExtraSmallMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width <= 300;
  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width <= 500;

  static bool isMobileLarge(BuildContext context) =>
      MediaQuery.sizeOf(context).width <= 700 &&
      MediaQuery.sizeOf(context).width >= 500;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width > 700;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 1024;



  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    if (size.width >= 1024) {
      return desktop;
    } else if (size.width >= 700 && tablet != null) {
      return tablet!;
    } else if (size.width >= 500 && mobileLarge != null) {
      return mobileLarge!;
    } else {
      return mobile;
    }
  }
}
