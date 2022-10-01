import 'package:first_app/bloc/popular_movies_bloc/popular_movies_state.dart';
import 'package:first_app/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularMovieCubit extends Cubit<PopularMovieState> {
  PopularMovieCubit({required this.repository})
      : super(const PopularMovieState.loading());

  final MovieRepository repository;

  Future<void> fetchList() async {
    try {
      final movieResponse = await repository.getPopuparMovies(1);
      emit(PopularMovieState.success(movieResponse.movies));
    } on Exception {
      emit(const PopularMovieState.failure());
    }
  }
}
