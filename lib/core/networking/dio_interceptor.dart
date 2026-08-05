import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_night/core/utils/constants/api_constants.dart';

class DioInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint("✅ Response: STATUS(${response.statusCode}) | URL(${response.requestOptions.path}) | DATA(${response.data})");
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint("❌ ERROR: STATUS(${err.response?.statusCode}) | URL(${err.requestOptions.path}) | MESSAGE(${err.message}) | DATA(${err.response?.data})");
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({"language": "en-US", "api_key": ApiConstants.key});
    debugPrint("🚀 REQUEST: METHODE(${options.method}) | URL(${options.path}) | DATA(${options.data}) | HEADERS(${options.headers}) | QUERY(${options.queryParameters})");
    handler.next(options);
  }
}
