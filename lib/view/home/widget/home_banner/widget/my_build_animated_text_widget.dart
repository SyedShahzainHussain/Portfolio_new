import 'package:flutter/material.dart';
import 'package:portfolio/config/color/colors.dart';
import '../../../../responsive.dart';
import 'animated_text_widget.dart';

class MyBuildAnimatedText extends StatelessWidget {
  const MyBuildAnimatedText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Responsive.isExtraSmallMobile(context)
          ? Theme.of(context).textTheme.bodySmall!
          : Theme.of(context).textTheme.bodyMedium!,
      maxLines: Responsive.isExtraSmallMobile(context) ? 1 : 2,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "I Build ",
            style: Responsive.isDesktop(context)
                ? Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.primaryColor)
                : Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppColors.primaryColor),
          ),
          Expanded(
            child: Responsive.isMobile(context)
                ? const AnimatedTextKitWidget()
                : const AnimatedTextKitWidget(),
          ),
        ],
      ),
    );
  }
}
