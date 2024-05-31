import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/drawer_change_bloc/drawer_change_bloc.dart';
import 'package:portfolio/utils/constant.dart';
import 'package:portfolio/utils/extension/general_extension.dart';
import 'package:portfolio/view/profile/profile.dart';
import 'package:portfolio/view/responsive.dart';

import '../contact/contact_screen.dart';
import '../drawer/drawer_screen.dart';
import '../home/home_screen.dart';

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
          children: [
            if (Responsive.isDesktop(context)) const SlideMenu(),
            defaultPadding.width,
            BlocBuilder<DrawerChangeBloc, DrawerChangeState>(
              builder: (context, state) {
                return Expanded(flex: 7, child: pages[state.currentIndex]);
              },
            ),
            defaultPadding.width,
          ],
        ),
      ),
    );
  }
}

List<Widget> pages = [
  const HomeScreen(),
  const ProfileScreen(),
  const ContactScreen(),
  const Center(
    child: Text("Work"),
  ),
  const Center(
    child: Text("Login"),
  ),
];
