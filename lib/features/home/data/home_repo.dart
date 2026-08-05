import 'package:dio/dio.dart';
import 'package:movie_night/core/networking/api_result.dart';
import 'package:movie_night/core/networking/end_points.dart';
import 'package:movie_night/features/home/data/models/home_category_model.dart';
import 'package:movie_night/features/home/data/models/movie_model.dart';

class HomeRepo {
  final Dio _dio;

  HomeRepo(this._dio);

  Future<ApiResult<List<MovieModel>>> getMovies(String endPoint) async {
    try {
      Response response = await _dio.get(endPoint);
      List<MovieModel> movies = response.data["results"].map<MovieModel>((movie) => MovieModel.fromJson(movie)).toList();
      return ApiResultSuccess(movies);
    } catch (exception, stackTrace) {
      print(stackTrace);
      print(exception);
      return ApiResultFailure(exception.toString());
    }
  }

  Future<ApiResult<List<HomeCategoryModel>>> getCategories() async {
    List<HomeCategoryModel> categories = [];
    ApiResult<List<MovieModel>> popular = await getMovies(EndPoints.popular);
    ApiResult<List<MovieModel>> upcoming = await getMovies(EndPoints.upcoming);
    ApiResult<List<MovieModel>> topRated = await getMovies(EndPoints.topRated);
    ApiResult<List<MovieModel>> nowPlaying = await getMovies(EndPoints.nowPlaying);

    if (popular is ApiResultSuccess<List<MovieModel>>) {
      categories.add(HomeCategoryModel(title: "Popular", movies: popular.data));
    }
    if (upcoming is ApiResultSuccess<List<MovieModel>>) {
      categories.add(HomeCategoryModel(title: "Upcoming", movies: upcoming.data));
    }
    if (topRated is ApiResultSuccess<List<MovieModel>>) {
      categories.add(HomeCategoryModel(title: "Top Rated", movies: topRated.data));
    }
    if (nowPlaying is ApiResultSuccess<List<MovieModel>>) {
      categories.add(HomeCategoryModel(title: "Now Playing", movies: nowPlaying.data));
    }
    return ApiResultSuccess(categories);
  }
}
