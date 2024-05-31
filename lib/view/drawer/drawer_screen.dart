import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/drawer_change_bloc/drawer_change_bloc.dart';
import 'package:portfolio/config/color/colors.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:iconsax/iconsax.dart';

class SlideMenu extends StatelessWidget {
  const SlideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerChangeBloc, DrawerChangeState>(
      builder: (context, state) {
        return SidebarX(
          footerDivider: const Divider(),
          controller: SidebarXController(
              selectedIndex: state.currentIndex, extended: true),
          items: [
            SidebarXItem(
              icon: Iconsax.home,
              label: 'Home',
              onTap: () {
                context.read<DrawerChangeBloc>().add(ChangePageIndex(index: 0));
                Scaffold.of(context).closeDrawer();
              },
            ),
            SidebarXItem(
              icon: Iconsax.profile_2user,
              label: 'Profile',
              onTap: () {
                context.read<DrawerChangeBloc>().add(ChangePageIndex(index: 1));
                Scaffold.of(context).closeDrawer();
              },
            ),
            SidebarXItem(
              icon: Iconsax.info_circle,
              label: 'Contact',
              onTap: () {
                context.read<DrawerChangeBloc>().add(ChangePageIndex(index: 2));
                Scaffold.of(context).closeDrawer();
              },
            ),
            SidebarXItem(
              icon: Iconsax.presention_chart,
              label: 'Projects',
              onTap: () {
                context.read<DrawerChangeBloc>().add(ChangePageIndex(index: 3));
                Scaffold.of(context).closeDrawer();
              },
            ),
            SidebarXItem(
              icon: Iconsax.login,
              label: 'Login',
              onTap: () {
                context.read<DrawerChangeBloc>().add(ChangePageIndex(index: 4));
                Scaffold.of(context).closeDrawer();
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
      },
    );
  }
}
