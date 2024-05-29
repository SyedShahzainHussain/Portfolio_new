import 'package:bloc_templates/config/components/internet_exception_widget.dart';
import 'package:bloc_templates/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/movie_bloc/movie_bloc.dart';
import '../../config/routes/route_name.dart';
import '../../services/session_controller/session_controller.dart';
import '../../services/storage/local_storage.dart';
import '../../utils/enums.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MoviesBloc moviesBloc;

  @override
  void initState() {
    super.initState();
    moviesBloc = MoviesBloc(moviesApiRepository: getIt());
  }

  @override
  void dispose() {
    moviesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SessionController().userModel.token),
        actions: [
          IconButton(
              onPressed: () async {
                await LocalStorage().clearValue("token").then((value) {
                  LocalStorage().clearValue("isLogin").then((value) {
                    if (context.mounted) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, RoutesName.splash, (route) => false);
                    }
                  });
                });
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: BlocProvider(
        create: (context) => moviesBloc..add(MoviesFetch()),
        child: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            switch (state.moviesList.status) {
              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case Status.error:
                if (state.moviesList.message == 'No Internet Connect') {
                  return InterNetExceptionWidget(onPress: () {
                    moviesBloc.add(MoviesFetch());
                  });
                }
                return Center(
                  child: Text(state.moviesList.message.toString()),
                );
              case Status.completed:
                if (state.moviesList.data == null) {
                  return const Center(
                    child: Text("No Data Found"),
                  );
                }
                final movieList = state.moviesList.data!;
                return ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(movieList.tvShow[index].name),
                        subtitle: Text(movieList.tvShow[index].startDate),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              movieList.tvShow[index].imageThumbnailPath),
                        ),
                      );
                    },
                    itemCount: movieList.tvShow.length);
              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
