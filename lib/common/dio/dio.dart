import 'package:dio/dio.dart';
import 'package:flutter_parking/secure_storage/secure_storage_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio.g.dart';

@riverpod
Dio dioState(ref) {
  //인스턴스 생성
  final dio = Dio();
  //시큐어 스토리지
  final storage = ref.watch(secureStorageStateProvider);

  dio.interceptors.add(CustomInterceptor(storage: storage));

  return dio;
}

class CustomInterceptor extends Interceptor {
  final FlutterSecureStorage storage;

  CustomInterceptor({
    required this.storage,
  });
  //요청
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('[Request]${options.uri}');
    super.onRequest(options, handler);
  }

  //응답
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('Response');
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  //에러
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('[DioError] type: ${err.type} message: ${err.message}');
    print('[DioError] stack: ${err.stackTrace}');
    // TODO: implement onError
    super.onError(err, handler);
  }
}
