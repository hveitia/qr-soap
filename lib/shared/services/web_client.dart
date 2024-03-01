import 'dart:core';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:rq_soap/configs/environment.dart';
import 'package:rq_soap/shared/contracts/web_client.dart';


class WebClient extends IWebClient {
  Dio? _dio;

  WebClient() {
    _dio = _createHttpClient();
  }

  Dio _createHttpClient() {
    var dio =  Dio()
      ..httpClientAdapter
      ..options.baseUrl = EnvironmentConstants.API_URL
      ..options.connectTimeout = 5000
      ..options.receiveTimeout = 20000
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
            return handler.next(options);
          },
          onResponse: (Response response, ResponseInterceptorHandler handler) {
            return handler.next(response);
          },
          onError: (DioError e, ErrorInterceptorHandler handler) {
            return handler.next(e);
          },
        ),
      );

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    return dio;
  }

  @override
  Map<String, dynamic> commonBehavior(Response<Map<String, dynamic>> response) {
    if (response.statusCode! >= 400) {
      throw ('En estos momentos estamos presentando problemas');
    }
    return response.data!;
  }

  @override
  Future<Map<String, dynamic>> commonErrorBehavior(Future<Response<Map<String, dynamic>>> request) async {
    try {
      final response = await request;
      return commonBehavior(response);
    } catch (e) {
      if (e is DioError && e.error is SocketException) {
        throw ('Por favor revisar su conexión a internet, estamos presentando problemas para realizar la operación.');
      } else {
        rethrow;
      }
    }
  }

  @override
  Future<Map<String, dynamic>> get(String uri, {Options? options}) async {
    return await commonErrorBehavior(_dio!.get(uri, options: options));
  }

  @override
  Future<Map<String, dynamic>> post(String uri, dynamic data, {Options? options}) async {
    return await commonErrorBehavior(_dio!.post(uri, data: data, options: options));
  }

  @override
  Future<Map<String, dynamic>> put(String uri, dynamic data, {Options? options}) async {
    return await commonErrorBehavior(_dio!.put(uri, data: data,  options: options));
  }

  @override
  Future<Map<String, dynamic>> patch(String uri, dynamic data, {Options? options}) async {
    return await commonErrorBehavior(_dio!.patch(uri, data: data, options: options));
  }

  @override
  Future<Map<String, dynamic>> delete(String uri, dynamic data, {Options? options}) async {
    return await commonErrorBehavior(_dio!.delete(uri, data: data, options: options));
  }

  @override
  Dio? get http => _dio;
}
