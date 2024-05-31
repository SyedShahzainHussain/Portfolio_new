import 'package:flutter/material.dart';

class ContactSubTitleWidget extends StatelessWidget {
  const ContactSubTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Fancy working together or just want to say hi? Drop me a message below.",
      style:
          Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
    );
  }
}
