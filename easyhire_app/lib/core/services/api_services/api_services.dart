import 'package:dio/dio.dart';
import 'package:easyhire_app/core/services/storage_services/token_storage_service.dart';
import 'package:easyhire_app/core/utils/api_endpoints.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../get.dart';

typedef QueryType = Map<String, dynamic>?;

class ApiManager {
  final _connectTimeout = const Duration(seconds: 20);
  final _receiveTimeout = const Duration(seconds: 20);
  final _sendTimeout = const Duration(seconds: 20);

  /// Dio instance used for API requests.
  late Dio dio;
  final TokenStorage tokenStorage;
  ApiManager(Ref ref, this.tokenStorage) {
    Map<String, dynamic> headers = {};

    BaseOptions options = BaseOptions(
        baseUrl: Get.baseUrl,
        connectTimeout: _connectTimeout,
        receiveTimeout: _receiveTimeout,
        sendTimeout: _sendTimeout,
        responseType: ResponseType.json,
        contentType: Headers.jsonContentType,
        headers: headers);

    dio = Dio(options);
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final accessToken = await tokenStorage.getAccessToken();
        if (accessToken != null) {
          options.headers['Authorization'] = 'Bearer $accessToken';
        }
        return handler.next(options);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          final refreshToken = await tokenStorage.getRefreshToken();
          if (refreshToken != null) {
            _refreshToken();
          }
        }
        return handler.next(error);
      },
    ));

    // dio.interceptors.add(ref.read(cacheResolverProvider));
  }

  Future<void> _refreshToken() async {
    final refreshToken = await tokenStorage.getRefreshToken();
    if (refreshToken != null) {
      try {
        final response = await dio.post(ApiEndpoints.refresh, data: {
          'refresh_token': refreshToken,
        });
        final newAccessToken = response.data['access_token'];
        final newRefreshToken = response.data['refresh_token'];

        await tokenStorage.saveTokens(newAccessToken, newRefreshToken);
      } catch (e) {
        await tokenStorage.clearTokens();
      }
    }
  }

  Future<Response> get(String path,
      {Options? options, Map<String, dynamic>? queryParameters}) async {
    return await dio.get(path,
        queryParameters: queryParameters, options: options);
  }

  Future<Response> post(String path,
      {Options? options, Map<String, dynamic>? data}) async {
    return await dio.post(path, data: data, options: options);
  }
}
