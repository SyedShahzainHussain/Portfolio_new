import 'package:flutter/material.dart';
import 'package:portfolio/config/color/colors.dart';
import 'package:portfolio/utils/constant.dart';

import '../../utils/helper_function.dart';

class AnimatedCircularProgressIndicator extends StatelessWidget {
  const AnimatedCircularProgressIndicator({
    super.key,
    required this.percentage,
    required this.label,
  });
  final double percentage;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 0.9,
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: percentage),
            duration: defaultDuration,
            builder: (context, value, child) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    strokeCap: StrokeCap.round,
                    value: value,
                    color: AppColors.primaryColor,
                    backgroundColor: AppColors.darkColor,
                  ),
                  Center(
                    child: Text(
                      "${(value * 100).toInt()}%",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  )
                ],
              );
            },
          ),
        ),
        const SizedBox(height: defaultPadding / 2),
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}

class AnimatedLinearProgressIndicator extends StatelessWidget {
  const AnimatedLinearProgressIndicator({
    super.key,
    required this.percentage,
    required this.label,
  });
  final double percentage;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding),
      child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: percentage),
          duration: defaultDuration,
          builder: (context, value, _) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      label,
                      style:  TextStyle(color:  HelperFunction.isDarkMode(context)?AppColors.whiteColor: AppColors.darkColor,),
                    ),
                    Text("${(value * 100).toInt()}%"),
                  ],
                ),
                const SizedBox(height: defaultPadding / 2),
                LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(8.0),
                  minHeight: 8,
                  value: value,
                  color: AppColors.primaryColor,
                  backgroundColor: AppColors.lightGrey,
                ),
              ],
            );
          }),
    );
  }
}
