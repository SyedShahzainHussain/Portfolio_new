import 'package:flutter/material.dart';
import 'package:portfolio/config/color/colors.dart';

class ContactSubTitleWidget extends StatelessWidget {
  const ContactSubTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Fancy working together or just want to say hi? Drop me a message below.",
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(color: AppColors.grey, fontWeight: FontWeight.w700),
    );
  }
}
