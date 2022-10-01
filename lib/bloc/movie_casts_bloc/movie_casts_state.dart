import 'package:equatable/equatable.dart';
import 'package:first_app/models/cast.dart';

enum ListStatus { loading, success, failure }

class MovieCastsState extends Equatable {
  const MovieCastsState._({
    this.status = ListStatus.loading,
    this.casts = const <Cast>[],
  });

  const MovieCastsState.loading() : this._();

  const MovieCastsState.success(List<Cast> casts)
      : this._(status: ListStatus.success, casts: casts);

  const MovieCastsState.failure() : this._(status: ListStatus.failure);

  final ListStatus status;
  final List<Cast> casts;

  @override
  List<Object> get props => [status, casts];
}
