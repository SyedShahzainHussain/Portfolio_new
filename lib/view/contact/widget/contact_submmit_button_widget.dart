import 'package:flutter/material.dart';

import '../../../config/color/colors.dart';

class ContactButton extends StatelessWidget {
  const ContactButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: ButtonStyle(
          shape: MaterialStateProperty.all(const BeveledRectangleBorder()),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.hovered)) {
              return AppColors.primaryColor;
            } else if (states.contains(MaterialState.pressed)) {
              return AppColors.primaryColor;
            }
            return null;
          }),
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.hovered)) {
              return Colors.white;
            } else if (states.contains(MaterialState.pressed)) {
              return Colors.white;
            }
            return AppColors.primaryColor;
          }),
          side: MaterialStateProperty.all(
              const BorderSide(color: AppColors.primaryColor, width: 2.0))),
      child: const Text("SEND"),
    );
  }
}
