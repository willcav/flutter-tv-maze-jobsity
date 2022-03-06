import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../data/http/http_client.dart';
import '../../../infra/http/dio_adapter.dart';
import 'dio_interceptor.dart';

HttpClient makeDioAdapter() {
  final Dio client = Dio();
  if (kDebugMode) {
    client.interceptors.add(
      DioInterceptor(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }

  return DioAdapter(client: client);
}
