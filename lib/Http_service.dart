import 'package:dio/dio.dart';

class HttpService {
  static final HttpService _singleton = HttpService._internal();
  factory HttpService() {
    return _singleton;
  }
  HttpService._internal();

  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://dummyjson.com'));

  Future<Response> get(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }

  Future<Response> post(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }
}
