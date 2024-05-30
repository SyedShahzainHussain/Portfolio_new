import 'package:flutter/material.dart';
import 'package:portfolio/utils/constant.dart';
import 'package:portfolio/utils/extension/general_extension.dart';
import 'package:portfolio/view/responsive.dart';

import '../home/widget/home_banner_widget.dart';
import 'widget/slide_menu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? null
          : AppBar(
              leading: Builder(
                builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
      drawer: const SlideMenu(),
      body: Container(
        constraints: const BoxConstraints(maxWidth: maxWidth),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context)) const SlideMenu(),
            defaultPadding.width,
            Expanded(flex: 7, child: children[0]),
            defaultPadding.width,
          ],
        ),
      ),
    );
  }
}

List<Widget> children = [
  const HomeBanner(),
];
