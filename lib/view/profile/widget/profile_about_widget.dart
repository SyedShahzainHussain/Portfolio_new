import 'package:flutter/material.dart';
import 'package:portfolio/utils/extension/general_extension.dart';
import 'package:portfolio/view/profile/widget/coding_widget.dart';
import 'package:portfolio/view/profile/widget/knowledges_widget.dart';

import '../../../config/color/colors.dart';
import '../../../utils/helper_function.dart';

class ProfileAboutWidget extends StatelessWidget {
  const ProfileAboutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("I am, Syed Shahzain",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color:  HelperFunction.isDarkMode(context)?AppColors.whiteColor: AppColors.darkColor,
                        fontWeight: FontWeight.bold,
                      )),
              (context.mediaQueryHeight * 0.01).height,
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus pulvinar magna ut bibendum imperdiet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum id tempor libero. Praesent vel magna eget purus dignissim interdum. Sed efficitur malesuada dui, ac interdum ante scelerisque non. Curabitur quis euismod lorem, vel rutrum ante. Sed non vestibulum turpis. Phasellus sit amet nisl in diam congue tristique. Nullam convallis lectus ac nisl iaculis, non posuere ipsum interdum. Vivamus nec justo ac sapien convallis maximus.",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: HelperFunction.isDarkMode(context)?AppColors.whiteColor: AppColors.darkColor,
                    ),
              ),
              (context.mediaQueryHeight * 0.01).height,
              Text(
                "What is my skill level ?",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color:  HelperFunction.isDarkMode(context)?AppColors.primaryColor: AppColors.lightGrey,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ipsum sit nibh amet egestas tellus.",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: HelperFunction.isDarkMode(context)?AppColors.whiteColor: AppColors.darkColor,
                    ),
              ),
              (context.mediaQueryHeight * 0.01).height,
              const KnowledgeText(text: "Flutter, Dart"),
              const KnowledgeText(text: "API Integration"),
              const KnowledgeText(text: "Firebase"),
              const KnowledgeText(text: "GIT Knowledge"),
              (context.mediaQueryHeight * 0.01).height,
              const Coding(),
            ],
          ),
        ),
        10.width,
      ],
    );
  }
}
