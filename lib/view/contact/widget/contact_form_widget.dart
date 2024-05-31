import 'package:flutter/material.dart';
import 'package:portfolio/config/components/input_field_widget.dart';
import 'package:portfolio/utils/extension/general_extension.dart';

import '../../../config/color/colors.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Name",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.primaryColor),
                  ),
                  10.height,
                  InputFieldWidget(
                    onChanged: (value) {},
                    validator: (value) {
                      return null;
                    },
                    title: "Enter your name...",
                  )
                ],
              ),
            ),
            10.width,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Email",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.primaryColor),
                  ),
                  10.height,
                  InputFieldWidget(
                    validator: (value) {
                      return null;
                    },
                    title: "Enter your email...",
                    onChanged: (value) {},
                  )
                ],
              ),
            )
          ],
        ),
        10.height,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Subject",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.primaryColor),
            ),
            10.height,
            InputFieldWidget(
              validator: (value) {
                return null;
              },
              title: "What should you like to talk to us about?",
              onChanged: (value) {},
            )
          ],
        ),
        10.height,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Message",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.primaryColor),
            ),
            10.height,
            InputFieldWidget(
              maxLines: 5,
              validator: (value) {
                return null;
              },
              title: "Type away :)",
              onChanged: (value) {},
            )
          ],
        ),
      ],
    );
  }
}
