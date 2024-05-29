part of 'movie_bloc.dart';

class MoviesState extends Equatable {
  const MoviesState({
    required this.moviesList,
  });

  final ApiResponse<MovieModel> moviesList;

  MoviesState copyWith({
    ApiResponse<MovieModel>? moviesList,
  }) {
    return MoviesState(
      moviesList: moviesList ?? this.moviesList,
    );
  }

  @override
  List<Object?> get props => [moviesList];
}
