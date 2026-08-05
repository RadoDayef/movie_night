import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_night/core/networking/dio_factory.dart';
import 'package:movie_night/features/home/data/home_repo.dart';
import 'package:movie_night/features/home/logic/home_cubit.dart';
import 'package:movie_night/features/splash/logic/splash_cubit.dart';

class DependencyInjection {
  DependencyInjection._();

  static final GetIt getIt = GetIt.instance;

  static void setUp() {
    /// Dio
    getIt.registerLazySingleton<Dio>(() => DioFactory.create());

    /// Repos
    getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt<Dio>()));

    /// Cubits
    getIt.registerFactory<SplashCubit>(() => SplashCubit());
    getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));
  }
}

/// Factory
/// Singleton
