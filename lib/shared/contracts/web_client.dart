import 'package:dio/dio.dart';

abstract class IWebClient {
  Dio? get http;
  Map<String, dynamic> commonBehavior(Response<Map<String, dynamic>> response);
  Future<Map<String, dynamic>> commonErrorBehavior(Future<Response<Map<String, dynamic>>> request);
  Future<dynamic> get(String uri, {Options? options});
  Future<dynamic> post(String uri, dynamic data, {Options? options});
  Future<dynamic> put(String uri, dynamic data, {Options? options});
  Future<dynamic> patch(String uri, dynamic data, {Options? options});
  Future<dynamic> delete(String uri, dynamic data, {Options? options});
}
