import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'network_manager.dart';

class Client {
  Future<Response?> request({
    required String path,
    required HttpMethods httpMethod,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    String? baseUrl,
    Duration? connectTimeout = const Duration(seconds: 20),
    bool isLogger = false,
  }) async {
    try {
      final testBaseUrl = baseUrl ?? 'https://dog.ceo/api';
      final Dio dio = NetworkDioManager()
          .addBaseUrl(testBaseUrl)
          .addTimeout(connectTimeout: connectTimeout)
          .addLoggerRequest(isLogger)
          .build();

      return dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          method: httpMethod.value,
          headers: {...?headers},
        ),
      );
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.stackTrace);
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print(e is Error ? e.stackTrace : StackTrace.current);
      }
      return null;
    }
  }
}

enum HttpMethods {
  get,
  post,
  delete,
  put;

  String get value {
    switch (this) {
      case HttpMethods.get:
        return 'GET';
      case HttpMethods.post:
        return 'POST';
      case HttpMethods.delete:
        return 'DELETE';
      case HttpMethods.put:
        return 'PUT';
    }
  }
}
