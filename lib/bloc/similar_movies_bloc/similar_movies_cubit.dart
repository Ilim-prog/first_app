import 'package:first_app/bloc/similar_movies_bloc/similar_movies_state.dart';
import 'package:first_app/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  SimilarMoviesCubit({required this.repository})
      : super(const SimilarMoviesState.loading());

  final MovieRepository repository;

  Future<void> fetchList(int movieId) async {
    try {
      final movieResponse = await repository.getSimilarMovies(movieId);
      emit(SimilarMoviesState.success(movieResponse.movies));
    } on Exception {
      emit(const SimilarMoviesState.failure());
    }
  }
}
