import 'package:flutter/material.dart';
import 'package:portfolio/utils/extension/general_extension.dart';

import 'widget/profile_area_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            (context.mediaQueryHeight * 0.08).height,
            const Center(
              child: ProfileAreaWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
