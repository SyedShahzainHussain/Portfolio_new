import 'package:flutter/material.dart';

import '../../../config/color/colors.dart';
import '../../../utils/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/helper_function.dart';

class KnowledgeText extends StatelessWidget {
  const KnowledgeText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: Row(
        children: [
          SvgPicture.asset("assets/icon/check.svg"),
          const SizedBox(width: defaultPadding / 2),
          Text(
            text,
            style: TextStyle(
              color: HelperFunction.isDarkMode(context)
                  ? AppColors.whiteColor
                  : AppColors.darkColor,
            ),
          ),
        ],
      ),
    );
  }
}
