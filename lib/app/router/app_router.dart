import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_night/app/router/app_routes.dart';
import 'package:movie_night/core/dependency_injection/dependency_injection.dart';
import 'package:movie_night/features/details/ui/details_screen.dart';
import 'package:movie_night/features/error/error_screen.dart';
import 'package:movie_night/features/home/data/models/movie_model.dart';
import 'package:movie_night/features/home/logic/home_cubit.dart';
import 'package:movie_night/features/home/ui/home_screen.dart';
import 'package:movie_night/features/splash/logic/splash_cubit.dart';
import 'package:movie_night/features/splash/ui/splash_screen.dart';

class AppRouter {
  AppRouter._();

  static Route onGeneratedRoute(RouteSettings settings) {
    switch (AppRoutes.fromRoute(settings.name)) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(create: (context) => DependencyInjection.getIt<HomeCubit>(), child: HomeScreen()),
        );
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(create: (context) => DependencyInjection.getIt<SplashCubit>(), child: SplashScreen()),
        );
      case AppRoutes.details:
        final MovieModel movie = settings.arguments as MovieModel;
        return MaterialPageRoute(builder: (context) => DetailsScreen(movie));
      default:
        return MaterialPageRoute(builder: (context) => ErrorScreen());
    }
  }
}
