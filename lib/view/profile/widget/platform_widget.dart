import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class Platforms extends StatelessWidget {
  const Platforms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: defaultPadding),
      color: const Color(0xFF24242E),
      child: Row(
        children: [
          const Spacer(),
          IconButton(
            
              onPressed: () async {
                if (await launchUrl(
                    Uri.parse(
                        "https://www.linkedin.com/in/syed-shahzain-hussain-420b86248?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app"),
                    mode: LaunchMode.externalApplication)) {}
              },
              icon: SvgPicture.asset("assets/icon/linkedin.svg")),
          IconButton(
              onPressed: () async {
                if (await launchUrl(
                    Uri.parse("https://github.com/SyedShahzainHussain"),
                    mode: LaunchMode.externalApplication)) {}
              },
              icon: SvgPicture.asset("assets/icon/github.svg")),
          const Spacer(),
        ],
      ),
    );
  }
}
