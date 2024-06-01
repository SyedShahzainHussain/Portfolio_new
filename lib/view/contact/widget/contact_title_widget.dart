import 'package:flutter/material.dart';

import '../../../config/color/colors.dart';
import '../../responsive.dart';

class ContactTitle extends StatelessWidget {
  const ContactTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("Contact Form",
        style: (Responsive.isMobile(context) ||
                Responsive.isExtraSmallMobile(context))
            ? Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: AppColors.lightGrey,
                  fontWeight: FontWeight.bold,
                  decorationColor: Colors.grey.withOpacity(0.8),
                )
            : Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: AppColors.lightGrey,
                  fontWeight: FontWeight.bold,
                  decorationColor: Colors.grey.withOpacity(0.8),
                ));
  }
}
