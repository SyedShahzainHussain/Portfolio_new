import 'package:flutter/material.dart';
import 'package:portfolio/config/color/colors.dart';
import 'package:portfolio/config/components/animated_circular_progress_indicator_widget.dart';
import 'package:portfolio/utils/extension/general_extension.dart';

import '../../../utils/constant.dart';
import '../../../utils/helper_function.dart';

class Coding extends StatelessWidget {
  const Coding({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(
            "Coding",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color:  HelperFunction.isDarkMode(context)?AppColors.primaryColor: AppColors.lightGrey,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Row(children: [

        const Expanded(
          child: AnimatedLinearProgressIndicator(
              percentage: 0.8, label: "Flutter"),
        ),
        10.width,
        const Expanded(
            child: AnimatedLinearProgressIndicator(
                percentage: 0.7, label: "Dart")),
        ],)
      ],
    );
  }
}
