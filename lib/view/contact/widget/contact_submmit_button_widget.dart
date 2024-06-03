import 'package:flutter/material.dart';

class ContactButton extends StatelessWidget {
  const ContactButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(shape: MaterialStateProperty.all(const BeveledRectangleBorder())),
      onPressed: () {},
      child: const Text("SEND"),
    );
  }
}
