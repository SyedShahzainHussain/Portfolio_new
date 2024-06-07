import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/contact_bloc/contact_bloc.dart';
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
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  10.height,
                  InputFieldWidget(
                    onChanged: (value) {
                      context.read<ContactBloc>().add(YourName(value));
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter a valid name";
                      }
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
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  10.height,
                  InputFieldWidget(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                    title: "Enter your email...",
                    onChanged: (value) {
                      context.read<ContactBloc>().add(YourEmail(value));
                    },
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
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.grey,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            10.height,
            InputFieldWidget(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter a valid subject";
                }
                return null;
              },
              title: "What should you like to talk to us about?",
              onChanged: (value) {
                context.read<ContactBloc>().add(YourSubject(value));
              },
            )
          ],
        ),
        10.height,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Message",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.grey,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            10.height,
            InputFieldWidget(
              maxLines: 5,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter a message";
                }
                return null;
              },
              title: "Type away :)",
              onChanged: (value) {
                context.read<ContactBloc>().add(YourMessage(value));
              },
            )
          ],
        ),
      ],
    );
  }
}
