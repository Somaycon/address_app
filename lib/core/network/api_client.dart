import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;
  ApiClient()
    : dio = Dio(
        BaseOptions(
          baseUrl: 'https://viacep.com.br/ws/',
          connectTimeout: Duration(seconds: 10),
        ),
      ) {
    dio.interceptors.add(LogInterceptor(responseBody: true));
  }
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.get(path, queryParameters: queryParameters);
  }
}
