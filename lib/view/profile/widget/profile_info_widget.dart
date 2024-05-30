import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
          color: const Color(0xFF242430),
          child: Column(
            children: [
              const Spacer(
                flex: 2,
              ),
              CircleAvatar(
                radius: 50,
                backgroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
                backgroundImage: const NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF7ZeiBqb0LXy2n7ERZ0B1oFgqvZnD-w_8OA&s"),
              ),
              const Spacer(),
              Text(
                "Syed Shahzain",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      overflow: TextOverflow.ellipsis,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
               Text(
                "Flutter Developer ",
                textAlign: TextAlign.center,
                style:Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(flex: 2),
            ],
          )),
    );
  }
}
