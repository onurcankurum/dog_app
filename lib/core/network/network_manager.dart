import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class INetworkManager<T> {
  INetworkManager<T> addBaseUrl(String baseUrl);
  INetworkManager<T> addBaseHeader(Iterable<MapEntry<String, String>> value);
  INetworkManager<T> addTimeout({
    Duration? connectTimeout,
    Duration? receiveTimeout,
  });
  INetworkManager<T> addLoggerRequest(bool isLogger);
  INetworkManager<T> addInterceptor(Interceptor interceptor);

  T build();
}

class NetworkDioManager implements INetworkManager<Dio> {
  Dio? _dio;
  late final String _baseUrl;
  List<MapEntry<String, String>>? _baseHeader;
  Duration? _connectTimeout;
  Duration? _receiveTimeout;
  Interceptors? interceptors;

  @override
  INetworkManager<Dio> addBaseUrl(String baseUrl) {
    _baseUrl = baseUrl;
    return this;
  }

  @override
  INetworkManager<Dio> addTimeout({
    Duration? receiveTimeout,
    Duration? connectTimeout,
  }) {
    _receiveTimeout = receiveTimeout;
    _connectTimeout = connectTimeout;
    return this;
  }

  @override
  INetworkManager<Dio> addBaseHeader(Iterable<MapEntry<String, String>> value) {
    _baseHeader = value.toList();

    return this;
  }

  @override
  INetworkManager<Dio> addLoggerRequest(bool isLogger) {
    if (!isLogger) return this;

    addInterceptor(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
      ),
    );

    return this;
  }

  @override
  INetworkManager<Dio> addInterceptor(Interceptor interceptor) {
    interceptors ??= Interceptors();
    interceptors?.add(interceptor);
    return this;
  }

  @override
  Dio build() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        headers: Map.fromEntries(_baseHeader ?? const Iterable.empty()),
        connectTimeout: _connectTimeout,
        receiveTimeout: _receiveTimeout,
        validateStatus: (status) => true,
      ),
    );

    if (interceptors != null) _dio?.interceptors.addAll(interceptors!);

    return _dio!;
  }
}
