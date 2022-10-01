import 'package:first_app/bloc/movie_detail_bloc/movie_detail_state.dart';
import 'package:first_app/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit({required this.repository})
      : super(const MovieDetailState.loading());

  final MovieRepository repository;

  Future<void> fetchMovie(int id) async {
    try {
      final movieResponse = await repository.getMovieDetail(id);

      emit(MovieDetailState.success(movieResponse.movieDetail));
    } on Exception {
      emit(const MovieDetailState.failure());
    }
  }
}
