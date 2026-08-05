import 'package:flutter/material.dart';
import 'package:movie_night/app/theming/app_colors.dart';
import 'package:movie_night/core/utils/extensions/num_extensions.dart';
import 'package:movie_night/features/home/data/models/home_category_model.dart';
import 'package:movie_night/features/home/data/models/movie_model.dart';
import 'package:movie_night/features/home/ui/widgets/home_movie_widget.dart';

class HomeCategoryWidget extends StatelessWidget {
  final HomeCategoryModel category;

  const HomeCategoryWidget(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          category.title,
          style: TextStyle(color: AppColors.whiteColor, fontWeight: .bold, fontSize: 18),
        ),
        12.vGap,
        SizedBox(
          height: 250,
          child: ListView.separated(
            scrollDirection: .horizontal,
            itemCount: category.movies.length,
            itemBuilder: (_, int index) {
              final MovieModel movie = category.movies[index];
              return HomeMovieWidget(movie);
            },
            separatorBuilder: (_, _) {
              return 8.hGap;
            },
          ),
        ),
      ],
    );
  }
}
