import 'package:dio/dio.dart';

class CustomInterceptor extends Interceptor {
  //요청
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('request');
    print(options);
    super.onRequest(options, handler);
  }

  //응답
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  //에러
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }
}
