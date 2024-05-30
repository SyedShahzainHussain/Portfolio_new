import 'package:flutter/material.dart';
import 'package:portfolio/config/color/colors.dart';
import 'package:sidebarx/sidebarx.dart';

class SlideMenu extends StatefulWidget {
  const SlideMenu({super.key});

  @override
  State<SlideMenu> createState() => _SlideMenuState();
}

class _SlideMenuState extends State<SlideMenu> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SidebarX(
      footerDivider: const Divider(),
      controller:
          SidebarXController(selectedIndex: currentIndex, extended: true),
      items: [
        SidebarXItem(
          icon: Icons.home,
          label: 'Home',
          onTap: () => {
            setState(() {
              currentIndex = 0;
            })
          },
        ),
        SidebarXItem(
          icon: Icons.search,
          label: 'Profile',
          onTap: () => {
            setState(() {
              currentIndex = 1;
            })
          },
        ),
        SidebarXItem(
          icon: Icons.search,
          label: 'About',
          onTap: () => {
            setState(() {
              currentIndex = 2;
            })
          },
        ),
        SidebarXItem(
          icon: Icons.search,
          label: 'Projects',
          onTap: () => {
            setState(() {
              currentIndex = 3;
            })
          },
        ),
        SidebarXItem(
          icon: Icons.login,
          label: 'Login',
          onTap: () => {
            setState(() {
              currentIndex = 4;
            })
          },
        ),
      ],
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        textStyle: const TextStyle(color: Colors.white),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.secondaryColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [
              AppColors.bgColor,
              AppColors.primaryColor,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
        ),
        margin: EdgeInsets.only(right: 10),
      ),
    );
  }
}
