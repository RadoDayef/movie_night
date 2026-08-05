import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie_night/app/router/app_routes.dart';
import 'package:movie_night/app/theming/app_colors.dart';
import 'package:movie_night/core/utils/extensions/context_extensions.dart';
import 'package:movie_night/core/utils/extensions/string_extensions.dart';
import 'package:movie_night/features/home/data/models/movie_model.dart';

class HomeMovieWidget extends StatelessWidget {
  final MovieModel movie;

  const HomeMovieWidget(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(AppRoutes.details.route, arguments: movie),
      child: Container(
        alignment: .center,
        decoration: BoxDecoration(color: AppColors.transparentColor.withAlpha(100), borderRadius: .circular(24)),
        width: context.screenWidth * 0.4,
        child: ClipRRect(
          borderRadius: .circular(23),
          child: CachedNetworkImage(
            fit: .cover,
            imageUrl: movie.posterPath.posterPath,
            placeholder: (_, _) => LoadingAnimationWidget.threeRotatingDots(size: 24, color: AppColors.whiteColor),
            errorWidget: (_, _, _) => Icon(Icons.error, size: 18),
          ),
        ),
      ),
    );
  }
}
