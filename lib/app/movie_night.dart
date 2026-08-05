import 'package:flutter/material.dart';
import 'package:movie_night/app/router/app_router.dart';
import 'package:movie_night/app/theming/app_theme.dart';
import 'package:movie_night/core/utils/constants/app_constants.dart';

class MovieNight extends StatelessWidget {
  const MovieNight({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme.theme, darkTheme: AppTheme.theme, title: AppConstants.appName, debugShowCheckedModeBanner: false, onGenerateRoute: AppRouter.onGeneratedRoute);
  }
}
