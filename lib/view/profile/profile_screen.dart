import 'package:flutter/material.dart';
import 'package:portfolio/config/color/colors.dart';
import 'package:portfolio/utils/extension/general_extension.dart';

import '../../utils/helper_function.dart';
import 'widget/profile_about_widget.dart';
import 'widget/profile_area_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (context.mediaQueryHeight * 0.08).height,
              const Center(
                child: ProfileAreaWidget(),
              ),
              20.height,
              Divider(
                color: Colors.grey.withOpacity(0.4),
              ),
              20.height,
              Text(
                "About Me",
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color:  HelperFunction.isDarkMode(context)?AppColors.primaryColor: AppColors.lightGrey,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              (context.mediaQueryHeight * 0.03).height,
              const ProfileAboutWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
