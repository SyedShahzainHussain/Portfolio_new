import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../view/responsive.dart';

class CarouselSliderWidget extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext, int, int)? itemBuilder;
  const CarouselSliderWidget({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        enlargeCenterPage: false,
        enlargeFactor: 0.0,
        viewportFraction: 1.0,
        autoPlay: true,
        aspectRatio: Responsive.isMobile(context)
            ? 2.5
            : Responsive.isExtraSmallMobile(context)
                ? 2
                : 3,
      ),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
