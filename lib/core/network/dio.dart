import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
      ),
    );

    // Add interceptors
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // we can add headers or tokens
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // Add logic for intercepting responses here
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          // Add logic for intercepting errors here
          return handler.next(e);
        },
      ),
    );
  }

  static Future<Response> getDate({
    required String baseUrl,
    required String url,
    Map<String, dynamic>? query,
    String? tokens,
  }) async {
    // Ensure the headers are set before each request
    dio.options.headers = {
      'Content-Type': 'application/json',
      // 'token': token
    };

    // Use Dio's get method to make a GET request
    return dio.get(
      baseUrl + url,
      queryParameters: query,
    );
  }
}
