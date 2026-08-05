import 'package:flutter/material.dart';
import 'package:movie_night/app/movie_night.dart';
import 'package:movie_night/core/dependency_injection/dependency_injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.setUp();
  runApp(MovieNight());
}
