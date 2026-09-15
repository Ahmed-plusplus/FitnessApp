import 'package:dio/dio.dart';

class ApiErrorHandler {
  static String handle(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout. Please try again.';

      case DioExceptionType.sendTimeout:
        return 'Request timeout. Please try again.';

      case DioExceptionType.receiveTimeout:
        return 'Server response timeout. Please try again.';

      case DioExceptionType.badResponse:
        return _handleStatusCode(exception.response?.statusCode);

      case DioExceptionType.cancel:
        return 'Request was cancelled.';

      case DioExceptionType.connectionError:
        return 'No internet connection.';

      case DioExceptionType.badCertificate:
        return 'Certificate error.';

      case DioExceptionType.transformTimeout:
        return 'Response processing timeout.';

      case DioExceptionType.unknown:
        return 'Something went wrong. Please try again.';
    }
  }

  static String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request.';
      case 401:
        return 'Unauthorized. Please login again.';
      case 403:
        return 'You do not have permission to perform this action.';
      case 404:
        return 'The requested resource was not found.';
      case 500:
        return 'Internal server error.';
      case 502:
      case 503:
      case 504:
        return 'Server is currently unavailable. Please try again later.';
      default:
        return 'Something went wrong. Please try again.';
    }
  }
}
