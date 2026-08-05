import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_night/core/utils/extensions/num_extensions.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashLoading()) {
    load();
  }

  void load() {
    Future.delayed(5.sec, () => emit(SplashSuccess()));
  }
}
