import 'package:dio/dio.dart';

Dio createDioClient() {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://bepserver.duckdns.org',
    ),
  );
  return dio;
}
