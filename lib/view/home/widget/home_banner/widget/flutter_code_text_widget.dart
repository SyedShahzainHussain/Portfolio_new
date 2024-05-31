
import 'package:flutter/widgets.dart';

import '../../../../../config/color/colors.dart';

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
            text: "Flutter",
            style: TextStyle(color: AppColors.primaryColor),
          ),
          TextSpan(text: ">"),
        ],
      ),
    );
  }
}
