import 'package:flutter/material.dart';
import 'package:portfolio/utils/extension/general_extension.dart';
import 'package:portfolio/utils/helper_function.dart';
import '../../../config/color/colors.dart';
import '../../responsive.dart';
import 'profile_cv_button_widget.dart';

class ProfileAreaWidget extends StatelessWidget {
  const ProfileAreaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ! Profile Pic
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
                color: Colors.black.withOpacity(0.3),
              )
            ],
            shape: BoxShape.circle,
            color: AppColors.primaryColor,
          ),
          padding: const EdgeInsets.all(8),
          child: CircleAvatar(
            radius:
                (Responsive.isDesktop(context) || Responsive.isTablet(context))
                    ? 100
                    : 70,
            backgroundColor: AppColors.darkColor,
            backgroundImage: const NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3WEmfJCME77ZGymWrlJkXRv5bWg9QQmQEzw&s"),
          ),
        ),
        20.height,
        // ! Name Text
        Text("Hellow I am, Syed Shahzain",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: HelperFunction.isDarkMode(context)?AppColors.whiteColor: AppColors.darkColor,
                  fontWeight: FontWeight.bold,
                )),
        10.height,
        Text(
          "Flutter Developer",
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color:  HelperFunction.isDarkMode(context)?AppColors.whiteColor: AppColors.darkColor,
                fontWeight: FontWeight.bold,
              ),
          textAlign: TextAlign.center,
        ),
        20.height,
        SizedBox(
          width: Responsive.isDesktop(context)
              ? context.mediaQueryWidth / 3
              : Responsive.isTablet(context)
                  ? context.mediaQueryWidth / 2
                  : context.mediaQueryWidth / 1,
          child: Text(
            "Mauris cursus libero eu gravida malesuada. Vivamus efficitur sollicitudin tincidunt. Vivamus iaculis, est et posuere facilisis, sem nisi volutpat enim, eget hendrerit libero ligula quis lacus",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color:  HelperFunction.isDarkMode(context)?AppColors.whiteColor: AppColors.darkColor,
                  overflow: TextOverflow.ellipsis,
                ),
            textAlign: TextAlign.center,
            softWrap: true,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        20.height,
        const CvButtonWidget()
      ],
    );
  }
}
