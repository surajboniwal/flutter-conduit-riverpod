import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

export 'package:dio/dio.dart';

class NetworkManager {
  final Dio dio;

  static final provider = Provider<NetworkManager>((ref) => NetworkManager());

  const NetworkManager._(this.dio);

  factory NetworkManager() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.realworld.io/api',
      ),
    );
    return NetworkManager._(dio);
  }

  Future<ApiResponse<Response, DioError>> request(
    RequestMethod method,
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response response = await dio.request(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          method: method.name,
          headers: headers,
        ),
      );

      return ApiResponse.completed(response);
    } on DioError catch (err) {
      return ApiResponse.error(err);
    }
  }
}

enum RequestMethod { get, post, patch, delete, put }

class ApiResponse<T, R> {
  late T data;
  late Status status;
  late R message;

  ApiResponse.completed(this.data) : status = Status.success;
  ApiResponse.error(this.message) : status = Status.error;
}

enum Status {
  success,
  error;

  bool isSuccess() => this == Status.success;
  bool isError() => this == Status.error;
}
