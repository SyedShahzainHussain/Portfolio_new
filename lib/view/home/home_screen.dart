import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:portfolio/utils/extension/general_extension.dart';
import 'package:portfolio/utils/helper_function.dart';
import '../../config/color/colors.dart';
import '../responsive.dart';
import '../work/widget/work_card_widget.dart';
import 'widget/home_banner/home_banner_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = HelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeBanner(),
              10.height,
              Text("My Project",
                  style: (Responsive.isMobile(context) ||
                          Responsive.isExtraSmallMobile(context))
                      ? Theme.of(context).textTheme.headlineSmall!.copyWith(
                            color: isDarkMode
                                ? AppColors.whiteColor
                                : AppColors.lightGrey,
                            fontWeight: FontWeight.bold,
                            decorationColor: Colors.grey.withOpacity(0.8),
                          )
                      : Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: isDarkMode
                                ? AppColors.whiteColor
                                : AppColors.lightGrey,
                            fontWeight: FontWeight.bold,
                            decorationColor: Colors.grey.withOpacity(0.8),
                          )),
              10.height,
              LayoutGrid(
                // set some flexible track sizes based on the crossAxisCount
                columnSizes: Responsive.isDesktop(context)
                    ? [1.fr, 1.fr, 1.fr]
                    : Responsive.isTablet(context)
                        ? [1.fr, 1.fr]
                        : [1.fr], // Two columns
                // set all the row sizes to auto (self-sizing height)
                rowGap: 40, // equivalent to mainAxisSpacing
                columnGap: 24,

                rowSizes: List.generate(10, (_) => auto),
                children: [
                  for (var i = 0; i < 5; i++) const WorkCardWidget(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
