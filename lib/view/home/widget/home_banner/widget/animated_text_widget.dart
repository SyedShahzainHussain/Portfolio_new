import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/config/components/animated_text_widget.dart';
import 'package:portfolio/view/responsive.dart';

class AnimatedTextKitWidget extends StatelessWidget {
  const AnimatedTextKitWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedTextWidget(
      animatedTexts: [
        TyperAnimatedText(
          "responsive web and mobile app.",
          speed: const Duration(milliseconds: 60),
          textStyle: Responsive.isDesktop(context)
              ? Theme.of(context).textTheme.bodyMedium!.copyWith()
              : (Responsive.isExtraSmallMobile(context) ||
                      Responsive.isMobile(context) ||
                      Responsive.isMobileLarge(context))
                  ? Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white)
                  : Theme.of(context).textTheme.bodySmall!.copyWith(),
        ),
        TyperAnimatedText(
          "complete e-Commerce app UI.",
          speed: const Duration(milliseconds: 60),
          textStyle: Responsive.isDesktop(context)
              ? Theme.of(context).textTheme.bodyMedium!.copyWith()
              : (Responsive.isExtraSmallMobile(context) ||
                      Responsive.isMobile(context) ||
                      Responsive.isMobileLarge(context))
                  ? Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white)
                  : Theme.of(context).textTheme.bodySmall!.copyWith(),
        ),
        TyperAnimatedText(
          "Chat app with and light theme.",
          speed: const Duration(milliseconds: 60),
          textStyle: Responsive.isDesktop(context)
              ? Theme.of(context).textTheme.bodyMedium!.copyWith()
              : (Responsive.isExtraSmallMobile(context) ||
                      Responsive.isMobile(context) ||
                      Responsive.isMobileLarge(context))
                  ? Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white)
                  : Theme.of(context).textTheme.bodySmall!.copyWith(),
        ),
      ],
    );
  }
}
