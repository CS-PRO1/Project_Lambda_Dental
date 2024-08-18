import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(baseUrl: 'http://192.168.25.230:9090/api/', headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    }));
  }

  static Future<Response?> getData(String url,
      {Map<String, dynamic>? query, String? token}) async {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await dio?.get(url, queryParameters: query);
  }

  static Future<Response?> postData(String url, Map<String, dynamic> body,
      {Map<String, dynamic>? query, String? token}) async {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await dio?.post(url, data: body, queryParameters: query);
  }

  static Future<Response?> updateData(String url, Map<String, dynamic> body,
      {Map<String, dynamic>? query, String? token}) async {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await dio?.put(url, data: body, queryParameters: query);
  }
}
