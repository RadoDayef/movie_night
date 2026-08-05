import 'package:dio/dio.dart';
import 'package:movie_night/core/networking/dio_interceptor.dart';
import 'package:movie_night/core/utils/constants/api_constants.dart';
import 'package:movie_night/core/utils/extensions/num_extensions.dart';

class DioFactory {
  DioFactory._();

  static Dio create() {
    Dio dio = Dio(BaseOptions(connectTimeout: 45.sec, receiveTimeout: 45.sec, baseUrl: ApiConstants.baseUrl, responseType: .json, contentType: Headers.jsonContentType));
    dio.interceptors.add(DioInterceptor());
    return dio;
  }
}
