import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie_night/app/theming/app_colors.dart';
import 'package:movie_night/core/utils/extensions/string_extensions.dart';
import 'package:movie_night/core/utils/extensions/widget_extensions.dart';
import 'package:movie_night/features/home/data/models/movie_model.dart';

class DetailsScreen extends StatelessWidget {
  final MovieModel movie;

  const DetailsScreen(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipRRect(
        borderRadius: .circular(23),
        child: CachedNetworkImage(
          fit: .cover,
          imageUrl: movie.posterPath.posterPath,
          placeholder: (_, _) => LoadingAnimationWidget.threeRotatingDots(size: 24, color: AppColors.whiteColor),
          errorWidget: (_, _, _) => Icon(Icons.error, size: 18),
        ),
      ).center,
    );
  }
}
