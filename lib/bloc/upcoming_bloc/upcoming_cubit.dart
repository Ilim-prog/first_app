import 'package:first_app/bloc/upcoming_bloc/upcoming_state.dart';
import 'package:first_app/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpComingCubit extends Cubit<UpComingState> {
  UpComingCubit({required this.repository})
      : super(const UpComingState.loading());

  final MovieRepository repository;

  Future<void> fetchUpComing() async {
    try {
      final movieResponse = await repository.getUpcomingMovies();
      emit(UpComingState.success(movieResponse.movies));
    } on Exception {
      emit(const UpComingState.failure());
    }
  }
}
