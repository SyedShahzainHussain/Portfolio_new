import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedTextWidget extends StatelessWidget {
  final List<AnimatedText> animatedTexts;
  const AnimatedTextWidget({
    super.key,
    required this.animatedTexts,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      
      displayFullTextOnTap: true,
      isRepeatingAnimation: true,
      
      totalRepeatCount: 100,
      animatedTexts: animatedTexts,

    );
  }
}
