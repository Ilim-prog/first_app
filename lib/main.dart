import 'package:first_app/app.dart';
import 'package:first_app/bloc/theme_bloc/theme_controller.dart';
import 'package:first_app/bloc/theme_bloc/theme_service.dart';
import 'package:first_app/repository/repository.dart';
// import 'package:first_app/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  final movieRepository = MovieRepository();
  final themeController = ThemeController(ThemeService());
  await themeController.loadSettings();
  runApp(App(
    themeController: themeController,
    movieRepository: movieRepository,
  ));
}
