import 'package:first_app/bloc/now_playing_bloc/now_playing_state.dart';
import 'package:first_app/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit({required this.repository})
      : super(const NowPlayingState.loading());

  final MovieRepository repository;

  Future<void> fetchList() async {
    try {
      final movieResponse = await repository.getNowPlaying(1);
      emit(NowPlayingState.success(movieResponse.movies));
    } on Exception {
      emit(const NowPlayingState.failure());
    }
  }
}
