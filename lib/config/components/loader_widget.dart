import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:portfolio/config/color/colors.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 15,
        height: 15,
        child: LoadingAnimationWidget.waveDots(
            color: AppColors.primaryColor, size: 15));
  }
}
