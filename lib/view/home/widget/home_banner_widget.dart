import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/utils/extension/general_extension.dart';

import '../../../config/color/colors.dart';
import '../../../utils/constant.dart';
import '../../responsive.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top:10),
      child: AspectRatio(
          aspectRatio: Responsive.isMobile(context)
              ? 2.5
              : Responsive.isExtraSmallMobile(context)
                  ? 2
                  : 3,
          child: Stack(
            children: [
              CarouselSlider.builder(
                options: CarouselOptions(
                  enlargeCenterPage: false,
                  enlargeFactor: 0.0,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  aspectRatio: Responsive.isMobile(context)
                      ? 2.5
                      : Responsive.isExtraSmallMobile(context)
                          ? 2
                          : 3,
                ),
                itemCount: 15,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                  blendMode: BlendMode.overlay,
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRn3TMWqActFbRjmUrZJ6o9NJXQ2f5WffNYGg&s",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Discover my Amazing \nArt Space!",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Responsive.isDesktop(context)
                          ? Theme.of(context).textTheme.displayLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )
                          : Responsive.isTablet(context)
                              ? Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  )
                              : Responsive.isMobileLarge(context)
                                  ? Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      )
                                  : Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                    ),
                    if (Responsive.isMobileLarge(context))
                      (defaultPadding / 2).height,
                    if (!Responsive.isMobileLarge(context))
                      (defaultPadding / 1).height,
                    const MyBuildAnimatedText(),
                    (defaultPadding / 1).height,
                    if (!Responsive.isMobile(context))
                      ElevatedButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          padding: EdgeInsets.symmetric(
                            horizontal: Responsive.isDesktop(context)
                                ? defaultPadding * 2
                                : Responsive.isTablet(context)
                                    ? defaultPadding
                                    : Responsive.isMobileLarge(context)
                                        ? defaultPadding - 10
                                        : 5,
                            vertical: Responsive.isDesktop(context)
                                ? defaultPadding
                                : Responsive.isTablet(context)
                                    ? defaultPadding - 10
                                    : Responsive.isMobileLarge(context)
                                        ? defaultPadding - 5
                                        : 3,
                          ),
                        ),
                        child: Text(
                          "EXPLORE NOW",
                          style: Responsive.isDesktop(context)
                              ? Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: AppColors.bgColor,
                                    fontWeight: FontWeight.bold,
                                  )
                              : Responsive.isTablet(context)
                                  ? Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: AppColors.bgColor,
                                        fontWeight: FontWeight.bold,
                                      )
                                  : Responsive.isMobileLarge(context)
                                      ? Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: AppColors.bgColor,
                                            fontWeight: FontWeight.bold,
                                          )
                                      : Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(
                                            color: AppColors.bgColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class MyBuildAnimatedText extends StatelessWidget {
  const MyBuildAnimatedText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Responsive.isExtraSmallMobile(context)
          ? Theme.of(context).textTheme.titleSmall!
          : Theme.of(context).textTheme.titleMedium!,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      child: Row(
        children: [
          if (!Responsive.isMobile(context)) const FlutterCodedText(),
          if (!Responsive.isMobile(context))
            const SizedBox(width: defaultPadding / 2),
          const Text("I build "),
          Responsive.isMobile(context)
              ? const Expanded(child: AnimatedText())
              : const AnimatedText(),
          if (!Responsive.isMobile(context))
            const SizedBox(width: defaultPadding / 2),
          if (!Responsive.isMobile(context)) const FlutterCodedText(),
        ],
      ),
    );
  }
}

class AnimatedText extends StatelessWidget {
  const AnimatedText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      displayFullTextOnTap: true,
      isRepeatingAnimation: true,
      totalRepeatCount: 100,
      animatedTexts: [
        TyperAnimatedText(
          "responsive web and mobile app.",
          speed: const Duration(milliseconds: 60),
        ),
        TyperAnimatedText(
          "complete e-Commerce app UI.",
          speed: const Duration(milliseconds: 60),
        ),
        TyperAnimatedText(
          "Chat app with dark and light theme.",
          speed: const Duration(milliseconds: 60),
        ),
      ],
    );
  }
}

class FlutterCodedText extends StatelessWidget {
  const FlutterCodedText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
        text: "<",
        children: [
          TextSpan(
            text: "flutter",
            style: TextStyle(color: AppColors.primaryColor),
          ),
          TextSpan(text: ">"),
        ],
      ),
    );
  }
}
