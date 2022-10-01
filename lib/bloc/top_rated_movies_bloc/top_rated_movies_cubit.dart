import 'package:first_app/bloc/top_rated_movies_bloc/top_rated_movies_state.dart';
import 'package:first_app/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  TopRatedCubit({required this.repository})
      : super(const TopRatedState.loading());

  final MovieRepository repository;

  Future<void> fetchTopRated() async {
    try {
      final movieResponse = await repository.getTopRatedMovies();
      emit(TopRatedState.success(movieResponse.movies));
    } on Exception {
      emit(const TopRatedState.failure());
    }
  }
}
