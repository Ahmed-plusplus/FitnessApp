import 'package:dio/dio.dart';

import 'api_consumer.dart';
import 'api_error_handler.dart';

class DioConsumer implements ApiConsumer {
  final Dio _dio;

  DioConsumer()
    : _dio = Dio(
        BaseOptions(
          baseUrl: 'https://fitness-d9b5-default-rtdb.firebaseio.com/',
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          sendTimeout: const Duration(seconds: 30),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

  @override
  Future<Response<dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.get(path, queryParameters: queryParameters);
    } on DioException catch (exception) {
      throw Exception(ApiErrorHandler.handle(exception));
    }
  }

  @override
  Future<Response<dynamic>> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );
    } on DioException catch (exception) {
      throw Exception(ApiErrorHandler.handle(exception));
    }
  }

  @override
  Future<Response<dynamic>> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.put(path, data: data, queryParameters: queryParameters);
    } on DioException catch (exception) {
      throw Exception(ApiErrorHandler.handle(exception));
    }
  }

  @override
  Future<Response<dynamic>> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );
    } on DioException catch (exception) {
      throw Exception(ApiErrorHandler.handle(exception));
    }
  }
}
