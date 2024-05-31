import 'package:flutter/material.dart';

class ClipBehavior extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Move to the top right corner
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);

    // Create curves on the left side
    path.lineTo(20, size.height);
    path.quadraticBezierTo(0, size.height * 3 / 4, 20, size.height / 2);
    path.quadraticBezierTo(0, size.height / 4, 20, 0);

    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
