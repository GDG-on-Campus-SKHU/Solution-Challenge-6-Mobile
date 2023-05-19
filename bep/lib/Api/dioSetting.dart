import 'package:dio/dio.dart';

Dio createDioClient() {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://bep-server-skr6jumqta-uc.a.run.app',
    ),
  );
  return dio;
}
