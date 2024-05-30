import 'package:flutter/material.dart';
import 'package:portfolio/config/components/animated_circular_progress_indicator_widget.dart';
import 'package:portfolio/utils/extension/general_extension.dart';

import '../../../utils/constant.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(
            "Skills",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.white),
          ),
        ),
        Row(
          children: [
            const Expanded(
                child: AnimatedCircularProgressIndicator(
                    percentage: 0.8, label: "Flutter")),
            defaultPadding.width,
            const Expanded(
                child: AnimatedCircularProgressIndicator(
                    percentage: 0.72, label: "Dart")),
            defaultPadding.width,
            const Expanded(
                child: AnimatedCircularProgressIndicator(
                    percentage: 0.71, label: "Api Integration")),
            defaultPadding.width,
            const Expanded(
                child: AnimatedCircularProgressIndicator(
                    percentage: 0.68, label: "Firebase")),
          ],
        )
      ],
    );
  }
}
