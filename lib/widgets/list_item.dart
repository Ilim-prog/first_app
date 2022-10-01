import 'package:first_app/models/movie.dart';
import 'package:flutter/material.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        leading: Text('${movie.id}', style: textTheme.caption),
        title: Text(movie.title),
        isThreeLine: true,
        subtitle: Text(movie.popularity.toString()),
        dense: true,
      ),
    );
  }
}
