import 'package:equatable/equatable.dart';
import 'package:first_app/models/movie.dart';

enum ListStatus { loading, success, failure }

class PopularMovieState extends Equatable {
  const PopularMovieState._({
    this.status = ListStatus.loading,
    this.movies = const <Movie>[],
  });

  const PopularMovieState.loading() : this._();

  const PopularMovieState.success(List<Movie> movies)
      : this._(status: ListStatus.success, movies: movies);

  const PopularMovieState.failure() : this._(status: ListStatus.failure);

  final ListStatus status;
  final List<Movie> movies;

  @override
  List<Object> get props => [status, movies];
}
