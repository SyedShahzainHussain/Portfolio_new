import 'package:flutter/material.dart';
import 'package:portfolio/utils/extension/general_extension.dart';

import '../../../config/animations/bottom_animations.dart';
import '../../../config/color/colors.dart';

class WorkCardWidget extends StatefulWidget {
  const WorkCardWidget({
    super.key,
  });

  @override
  State<WorkCardWidget> createState() => _WorkCardWidgetState();
}

class _WorkCardWidgetState extends State<WorkCardWidget> {
  @override
  Widget build(BuildContext context) {
    return WidgetAnimation(
      child: Material(
        borderRadius: BorderRadius.circular(12.0),
        color: AppColors.whiteColor,
        elevation: 5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
              child: Image.network(
                'https://images.unsplash.com/photo-1498050108023-c5249f4df085?ixlib=rb-1.2.1&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;auto=format&amp;fit=crop&amp;w=1352&amp;q=80&quot',
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Flutter Projects",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    10.height,
                    const Text(
                      "Ultimate JavaScript Course",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    10.height,
                    const Text(
                      "This latest JavaScript course comes with premium curriculum that covers everything from basics to advance. On top of that, you will get my handwritten notes of JS for completely free. What are you waiting for? Just Enroll Buddy Start Watching",
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 6,
                    ),
                  ],
                ),
              ),
            ),
            8.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                  style: const ButtonStyle(shape: MaterialStatePropertyAll(BeveledRectangleBorder())),
                  onPressed: () {},
                  child: const Text("Get Code"),
                ),
                TextButton(
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                      const BorderSide(
                        color: AppColors.darkColor,
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) {
                        if (states.contains(MaterialState.hovered)) {
                          return AppColors.darkColor;
                        } else if (states.contains(MaterialState.pressed)) {
                          return AppColors.darkColor;
                        }
                        return AppColors.whiteColor;
                      },
                    ),
                    foregroundColor: MaterialStateProperty.resolveWith(
                      (states) {
                        if (states.contains(MaterialState.hovered)) {
                          return AppColors.whiteColor;
                        } else if (states.contains(MaterialState.pressed)) {
                          return AppColors.whiteColor;
                        }
                        return AppColors.darkColor;
                      },
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Download Apk"),
                ),
              ],
            ),
            10.height,
          ],
        ),
      ),
    );
  }
}
