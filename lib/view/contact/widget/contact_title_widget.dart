
import 'package:flutter/material.dart';

import '../../../config/color/colors.dart';
import '../../responsive.dart';

class ContactTitle extends StatelessWidget {
  const ContactTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("CONTACT FORM",
        style: (Responsive.isMobile(context) ||
                Responsive.isExtraSmallMobile(context))
            ? Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(
                  color: AppColors.primaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.grey.withOpacity(0.8),
                )
            : (Responsive.isMobileLarge(context) ||
                    Responsive.isTablet(context))
                ? Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          Colors.grey.withOpacity(0.8),
                    )
                : Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          Colors.grey.withOpacity(0.8),
                    ));
  }
}
