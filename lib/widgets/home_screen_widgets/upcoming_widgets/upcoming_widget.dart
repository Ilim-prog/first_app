// ignore_for_file: library_private_types_in_public_api

import 'package:first_app/bloc/theme_bloc/theme_controller.dart';
import 'package:first_app/repository/repository.dart';
import 'package:first_app/widgets/home_screen_widgets/upcoming_widgets/upcoming_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpComingWidget extends StatefulWidget {
  const UpComingWidget(
      {Key? key, required this.themeController, required this.movieRepository})
      : super(key: key);

  final ThemeController themeController;
  final MovieRepository movieRepository;

  @override
  _UpComingWidgetState createState() => _UpComingWidgetState();
}

class _UpComingWidgetState extends State<UpComingWidget> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: widget.movieRepository,
      child: const UpComingSlider(),
    );
  }
}
