import 'package:first_app/bloc/similar_movies_bloc/similar_movies_cubit.dart';
import 'package:first_app/bloc/similar_movies_bloc/similar_movies_state.dart';
import 'package:first_app/bloc/theme_bloc/theme_controller.dart';
import 'package:first_app/repository/repository.dart';
import 'package:first_app/widgets/home_screen_widgets/movie_widgets_loader.dart';
import 'package:first_app/widgets/home_screen_widgets/movies_list_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarMoviesWidget extends StatelessWidget {
  const SimilarMoviesWidget(
      {Key? key,
      required this.movieId,
      required this.themeController,
      required this.movieRepository})
      : super(key: key);
  final ThemeController themeController;
  final MovieRepository movieRepository;
  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SimilarMoviesCubit(
        repository: context.read<MovieRepository>(),
      )..fetchList(movieId),
      child: SimilarMoviesList(
        movieId: movieId,
        movieRepository: movieRepository,
        themeController: themeController,
      ),
    );
  }
}

class SimilarMoviesList extends StatelessWidget {
  const SimilarMoviesList(
      {Key? key,
      required this.movieId,
      required this.themeController,
      required this.movieRepository})
      : super(key: key);
  final ThemeController themeController;
  final MovieRepository movieRepository;
  final int movieId;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SimilarMoviesCubit>().state;

    switch (state.status) {
      case ListStatus.failure:
        return const Center(
            child: Text(
          'Oops something went wrong!',
          style: TextStyle(color: Colors.white),
        ));
      case ListStatus.success:
        return MoviesListHorizontal(
          movies: state.movies,
          movieRepository: movieRepository,
          themeController: themeController,
        );
      default:
        return buildMovielistLoaderWidget(context);
    }
  }
}
