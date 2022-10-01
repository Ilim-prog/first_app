import 'package:first_app/bloc/movie_list_bloc/movie_list_state.dart';
import 'package:first_app/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieListCubit extends Cubit<MovieListState> {
  MovieListCubit({required this.repository})
      : super(const MovieListState.loading());

  final MovieRepository repository;

  Future<void> fetchList() async {
    try {
      final movieResponse = await repository.getMovies(1);
      emit(MovieListState.success(movieResponse.movies));
    } on Exception {
      emit(const MovieListState.failure());
    }
  }
}
