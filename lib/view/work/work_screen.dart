import 'package:flutter/material.dart';

import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:portfolio/view/responsive.dart';

import 'widget/work_card_widget.dart';

class WorkScreen extends StatelessWidget {
  const WorkScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: LayoutGrid(
              // set some flexible track sizes based on the crossAxisCount
              columnSizes: Responsive.isDesktop(context)
                  ? [1.fr, 1.fr, 1.fr]
                  : Responsive.isTablet(context)
                      ? [1.fr, 1.fr]
                      : [1.fr], // Two columns
              // set all the row sizes to auto (self-sizing height)
              rowGap: 40, // equivalent to mainAxisSpacing
              columnGap: 24,

              rowSizes: List.generate(
                  10, (_) => auto), // Adjust based on the number of rows needed
              children: [
                for (var i = 0; i < 10; i++) const WorkCardWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
