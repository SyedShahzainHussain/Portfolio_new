import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/config/color/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/constant.dart';

class Platforms extends StatelessWidget {
  const Platforms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: defaultPadding),
      color: const Color(0xFF24242E),
      child: Column(
        children: [
          _buildIconButton(
            url:
                "https://www.linkedin.com/in/syed-shahzain-hussain-420b86248?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app",
            assetPath: "assets/icon/linkedin.svg",
          ),
          _buildIconButton(
            url: "https://github.com/SyedShahzainHussain",
            assetPath: "assets/icon/github.svg",
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton({required String url, required String assetPath}) {
    return IconButton(
      onPressed: () async {
        if (await launchUrl(
          Uri.parse(url),
          mode: LaunchMode.externalApplication,
        )) {}
      },
      icon: SvgPicture.asset(
        assetPath,
        colorFilter: const ColorFilter.mode(
          AppColors.whiteColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
