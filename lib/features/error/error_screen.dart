import 'package:flutter/material.dart';
import 'package:movie_night/app/theming/app_colors.dart';
import 'package:movie_night/core/utils/extensions/num_extensions.dart';
import 'package:movie_night/core/utils/extensions/widget_extensions.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Icon(Icons.warning_rounded, color: AppColors.whiteColor, size: 100),
            24.vGap,
            Text("Route Not Found", style: TextStyle(color: AppColors.whiteColor, fontSize: 24)),
          ],
        ).center,
      ),
    );
  }
}
