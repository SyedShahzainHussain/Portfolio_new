import 'package:flutter/material.dart';
import 'package:portfolio/utils/extension/general_extension.dart';

import '../../../utils/constant.dart';
import 'area_info_widget.dart';
import 'coding_widget.dart';
import 'cv_widget.dart';
import 'knowledges_widget.dart';
import 'platform_widget.dart';
import 'profile_info_widget.dart';
import 'skills_widget.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileInfo(),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  const AreaInfoText(
                    title: "Residence",
                    text: "Pakistan",
                  ),
                  const AreaInfoText(
                    title: "City",
                    text: "Karachi",
                  ),
                  const AreaInfoText(
                    title: "Age",
                    text: "22",
                  ),
                  const Skills(),
                  defaultPadding.height,
                  const Coding(),
                  const Knowledges(),
                  const Divider(),
                  const SizedBox(height: defaultPadding / 2),
                  const CV(),
                  const Platforms()
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
