import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'dart:developer' as dev;

import '../APIs/http_constant.dart';

class CustomDio {
  static final CustomDio _singleton = CustomDio._internal();
  Dio dio = Dio(BaseOptions(
    baseUrl: baseUrl,
  ));
  var logger = Logger();
  factory CustomDio() {
    return _singleton;
  }

  Future<Dio> getDio() async {
    dio.interceptors.clear();
    dio.options.headers = await getTokenHeaders();
    dio.interceptors.add(getInterceptorsWrapper());
    return dio;
  }

  InterceptorsWrapper getInterceptorsWrapper() {
    return InterceptorsWrapper(onRequest: (
      RequestOptions requestOptions,
      RequestInterceptorHandler handler,
    ) {
      dev.log("============== REQUEST LOG ====================");
      dev.log("URL REQUEST --> ${requestOptions.uri}");
      dev.log("METHOD TYPE --> ${requestOptions.method}");
      dev.log("HEADERS --> ${requestOptions.headers}");
      dev.log("EXTRA --> ${requestOptions.extra}");
      dev.log("DATA --> ${requestOptions.data}");
      dev.log("QUERY PARAMETER --> ${requestOptions.queryParameters}");
      dev.log("============== REQUEST LOG ====================");

      return handler.next(requestOptions);
    }, onResponse: (
      Response response,
      ResponseInterceptorHandler handler,
    ) {
      dev.log("============== RESPONSE LOG ====================");
      dev.log("URL RESPONSE --> ${response.realUri}");
      dev.log("STATUS CODE --> ${response.statusCode}");
      dev.log("HEADERS --> ${response.headers}");
      dev.log("DATA --> ${response.data}");
      dev.log("PATH --> ${response.requestOptions.path}");
      dev.log("============== RESPONSE LOG ====================");

      return handler.next(response);
    }, onError: (
      DioError dioError,
      ErrorInterceptorHandler handler,
    ) {
      dev.log("============== ERROR LOG ====================");
      dev.log("ERROR --> ${dioError.error}");
      dev.log("ERROR MESSAGE --> ${dioError.message}");
      dev.log("ERROR METHOD TYPE --> ${dioError.requestOptions.method}");
      dev.log("ERROR URL --> ${dioError.requestOptions.uri}");
      dev.log("HEADERS --> ${dioError.requestOptions.headers}");
      dev.log("PATH --> ${dioError.requestOptions.path}");
      dev.log("============== ERROR LOG ====================");

      return handler.next(dioError);
    });
  }

  Future<Map<String, dynamic>> getTokenHeaders() async {
    Map<String, dynamic> data = <String, dynamic>{};
    data[keyContentType] = valueContentType;
    return data;
  }

  CustomDio._internal();
}
