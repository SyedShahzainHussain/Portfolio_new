import 'package:flutter/material.dart';
import 'package:portfolio/config/color/colors.dart';
import 'package:portfolio/utils/extension/general_extension.dart';

import '../../../utils/constant.dart';

class AreaInfoText extends StatelessWidget {
  const AreaInfoText({
    super.key,
    this.title,
    this.text,
  });

  final String? title, text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: Row(
        children: [
          Text(
            title!,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppColors.darkColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          10.width,
          Text(text!,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColors.darkColor,
                    fontWeight: FontWeight.w500,
                  )),
        ],
      ),
    );
  }
}
