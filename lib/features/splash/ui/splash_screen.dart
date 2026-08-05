import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie_night/app/router/app_routes.dart';
import 'package:movie_night/app/theming/app_colors.dart';
import 'package:movie_night/core/utils/constants/app_constants.dart';
import 'package:movie_night/core/utils/constants/image_constants.dart';
import 'package:movie_night/core/utils/extensions/context_extensions.dart';
import 'package:movie_night/core/utils/extensions/num_extensions.dart';
import 'package:movie_night/core/utils/extensions/widget_extensions.dart';
import 'package:movie_night/features/splash/logic/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (_, state) {
          if (state is SplashSuccess) {
            Navigator.of(context).pushReplacementNamed(AppRoutes.home.route);
          }
        },
        child: SafeArea(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Spacer(),
              Container(
                padding: .all(16),
                decoration: BoxDecoration(color: Colors.white, borderRadius: .circular(24)),
                child: Image.asset(ImageConstants.logo, width: context.screenWidth * 0.25),
              ),
              12.vGap,
              Text(
                AppConstants.appName,
                style: TextStyle(color: AppColors.whiteColor, fontSize: 28, fontWeight: .bold),
              ),
              8.vGap,
              Text(AppConstants.appSlogan, style: TextStyle(color: AppColors.whiteColor.withAlpha(150), fontSize: 18)),
              Spacer(),
              LoadingAnimationWidget.threeRotatingDots(size: 24, color: AppColors.whiteColor),
              12.vGap,
            ],
          ).center,
        ),
      ),
    );
  }
}
