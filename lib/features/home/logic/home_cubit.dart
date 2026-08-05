import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_night/core/networking/api_result.dart';
import 'package:movie_night/features/home/data/home_repo.dart';
import 'package:movie_night/features/home/data/models/home_category_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _repo;

  HomeCubit(this._repo) : super(HomeLoading()) {
    getData();
  }

  void getData() async {
    ApiResult<List<HomeCategoryModel>> result = await _repo.getCategories();
    if (result is ApiResultSuccess<List<HomeCategoryModel>>) {
      emit(HomeSuccess(result.data));
    } else {
      emit(HomeFailure((result as ApiResultFailure).message));
    }
  }
}
