import 'package:first_app/bloc/movie_casts_bloc/movie_casts_state.dart';
import 'package:first_app/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieCastsCubit extends Cubit<MovieCastsState> {
  MovieCastsCubit({required this.repository})
      : super(const MovieCastsState.loading());

  final MovieRepository repository;

  Future<void> fetchCasts(int movieId) async {
    try {
      final movieResponse = await repository.getCasts(movieId);
      emit(MovieCastsState.success(movieResponse.casts));
    } on Exception {
      emit(const MovieCastsState.failure());
    }
  }
}
