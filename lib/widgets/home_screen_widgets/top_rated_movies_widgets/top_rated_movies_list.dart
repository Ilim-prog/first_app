import 'package:first_app/bloc/theme_bloc/theme_controller.dart';
import 'package:first_app/bloc/top_rated_movies_bloc/top_rated_movies_cubit.dart';
import 'package:first_app/bloc/top_rated_movies_bloc/top_rated_movies_state.dart';
import 'package:first_app/repository/repository.dart';
import 'package:first_app/widgets/home_screen_widgets/movie_widgets_loader.dart';
import 'package:first_app/widgets/home_screen_widgets/movies_list_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedMoviesList extends StatelessWidget {
  const TopRatedMoviesList(
      {Key? key, required this.themeController, required this.movieRepository})
      : super(key: key);
  final ThemeController themeController;
  final MovieRepository movieRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TopRatedCubit(
        repository: context.read<MovieRepository>(),
      )..fetchTopRated(),
      child: TopRatedMovieView(
        themeController: themeController,
        movieRepository: movieRepository,
      ),
    );
  }
}

class TopRatedMovieView extends StatelessWidget {
  const TopRatedMovieView(
      {Key? key, required this.themeController, required this.movieRepository})
      : super(key: key);
  final ThemeController themeController;
  final MovieRepository movieRepository;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TopRatedCubit>().state;
    switch (state.status) {
      case ListStatus.failure:
        return const Center(child: Text('Oops something went wrong!'));
      case ListStatus.success:
        if (state.movies.isEmpty) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: const <Widget>[
                    Text(
                      "No More Top Rated Movies",
                      style: TextStyle(color: Colors.black45),
                    )
                  ],
                )
              ],
            ),
          );
        } else {
          return MoviesListHorizontal(
            movies: state.movies,
            movieRepository: movieRepository,
            themeController: themeController,
          );
        }
      default:
        return buildMovielistLoaderWidget(context);
    }
  }
}
