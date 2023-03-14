// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings, file_names

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:nb_utils/nb_utils.dart';
import 'config.dart';
import 'constants.dart';

class Api {
  final Dio api = Dio();

  final dio = createDio();

  final tokenDio = Dio(BaseOptions(baseUrl: MyConfig.appUrl));

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: MyConfig.appUrl,
      receiveTimeout: const Duration(seconds: 15000), // 15 seconds
      connectTimeout: const Duration(seconds: 15000),
      sendTimeout: const Duration(seconds: 15000),
    ));
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        return handler.next(e);
      },
    ));
    dio.interceptors.addAll({
      AppInterceptors(dio),
    });
    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    return dio;
  }

  Future<Response> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    DioError? error,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response = await dio.post<String>(
        uri,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      print("Post " + response.data);

      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    DioError? error,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response = await dio.get<String>(
        uri,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      // refreshToken();
      throw const FormatException("Unable to get the data");
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<Response> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    DioError? error,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response = await dio.put<String>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to get the data");
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<Response> delete(
    String uri, {
    Future? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      Response response = await dio.delete<String>(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to delete the data");
    } catch (e) {
      rethrow;
    }
  }
}

class AppInterceptors extends Interceptor {
  final Dio dio;

  AppInterceptors(this.dio);

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = getStringAsync(accessToken);

    options.headers.addAll({
      "Authorization": "Bearer $token",
      'content-Type': 'application/json',
      "validateStatus": (_) => true,
    });
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(err.type);
    print(err.response);

    return handler.next(err);
  }
}

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r, String errorMsg)
      : super(requestOptions: r, error: errorMsg);

  @override
  String toString() {
    return error.toString();
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r, String errorMsg)
      : super(requestOptions: r, error: errorMsg);

  @override
  String toString() {
    return error.toString();
  }
}

class ConflictException extends DioError {
  ConflictException(RequestOptions r, String errorMsg)
      : super(requestOptions: r, error: errorMsg);

  @override
  String toString() {
    return error.toString();
  }
}

class UnauthorizedException extends DioError {
  UnauthorizedException(RequestOptions r, String errorMsg)
      : super(requestOptions: r, error: errorMsg);

  @override
  String toString() {
    return error.toString();
  }
}

class NotFoundException extends DioError {
  NotFoundException(RequestOptions r, String errorMsg)
      : super(requestOptions: r, error: errorMsg);

  @override
  String toString() {
    return error.toString();
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r, String errorMsg)
      : super(requestOptions: r, error: errorMsg);
  @override
  String toString() {
    return error.toString();
  }
}

class DeadlineExceededException extends DioError {
  DeadlineExceededException(RequestOptions r, String errorMsg)
      : super(requestOptions: r, error: errorMsg);

  @override
  String toString() {
    return error.toString();
  }
}
