import 'package:flutter/material.dart';
import 'package:portfolio/config/components/animated_circular_progress_indicator_widget.dart';

import '../../../utils/constant.dart';

class Coding extends StatelessWidget {
  const Coding({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(
            "Coding",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.white),
          ),
        ),
        const AnimatedLinearProgressIndicator(
            percentage: 0.8, label: "Flutter"),
        const AnimatedLinearProgressIndicator(percentage: 0.7, label: "Dart"),
      ],
    );
  }
}
