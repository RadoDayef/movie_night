import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie_night/app/theming/app_colors.dart';
import 'package:movie_night/core/utils/constants/app_constants.dart';
import 'package:movie_night/core/utils/extensions/num_extensions.dart';
import 'package:movie_night/core/utils/extensions/widget_extensions.dart';
import 'package:movie_night/features/home/data/models/home_category_model.dart';
import 'package:movie_night/features/home/logic/home_cubit.dart';
import 'package:movie_night/features/home/ui/widgets/home_category_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.transparentColor,
        surfaceTintColor: AppColors.transparentColor,
        title: Text(AppConstants.appName, style: TextStyle(fontSize: 24, fontWeight: .bold)),
        actions: [Icon(Icons.search), 12.hGap],
      ),
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (_, state) {
            if (state is HomeLoading) {
              return LoadingAnimationWidget.threeRotatingDots(size: 24, color: AppColors.whiteColor).center;
            } else if (state is HomeSuccess) {
              return ListView.separated(
                padding: .all(16),
                itemCount: state.data.length,
                itemBuilder: (_, int index) {
                  final HomeCategoryModel category = state.data[index];
                  return HomeCategoryWidget(category);
                },
                separatorBuilder: (_, _) {
                  return 24.vGap;
                },
              );
            } else {
              return Column(
                mainAxisAlignment: .center,
                children: [
                  Icon(Icons.warning_rounded, color: AppColors.whiteColor, size: 100),
                  24.vGap,
                  Text((state as HomeFailure).message, style: TextStyle(color: AppColors.whiteColor, fontSize: 24)),
                ],
              ).center;
            }
          },
        ),
      ),
    );
  }
}
