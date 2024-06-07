import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/logout/logout_bloc.dart';
import 'package:portfolio/config/color/colors.dart';
import 'package:portfolio/config/routes/route_name.dart';

class AdminMainScreen extends StatelessWidget {
  const AdminMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin"),
        actions: [
          BlocListener<LogoutBloc, LogoutState>(
            listener: (context, state) {
              if (state.isLogout) {
                Navigator.pushNamedAndRemoveUntil(
                    context, RoutesName.splash, (route) => false);
              }
            },
            child: IconButton(
                onPressed: () {
                  BlocProvider.of<LogoutBloc>(context).add(Logout());
                },
                icon: const Icon(
                  Icons.logout,
                  color: AppColors.whiteColor,
                )),
          )
        ],
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
