import 'package:flutter/material.dart';
import 'package:portfolio/utils/extension/general_extension.dart';

import '../work/work_screen.dart';
import 'widget/home_banner/home_banner_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HomeBanner(),
        ],
      ),
    );
  }
}
