import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../data/http/http_client.dart';
import '../../data/http/http_error.dart';

class DioAdapter implements HttpClient {
  final Dio client;

  DioAdapter({
    required this.client,
  });

  @override
  Future request({
    required String url,
    required RequestMethod method,
    Map<String, dynamic> queryParameters = const {},
    Map<String, dynamic> body = const {},
    Map<String, dynamic> headers = const {},
  }) async {
    late final Map<String, dynamic> defaultHeaders;

    if (headers.isNotEmpty) {
      defaultHeaders = headers;
    } else {
      defaultHeaders = {
        'Content-Type': 'application/json',
        'accept': 'application/json'
      };
    }

    Response response = Response(
      data: '',
      statusCode: 500,
      requestOptions: RequestOptions(
        path: url,
        headers: defaultHeaders,
      ),
    );

    late final Future<Response>? futureResponse;

    try {
      futureResponse = _getResponse(
        method: method,
        url: url,
        queryParameters: queryParameters,
        options: Options(
          headers: defaultHeaders,
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
        ),
        body: body,
      );

      response = await futureResponse.timeout(const Duration(seconds: 15));
    } catch (error) {
      debugPrint(error.toString());
      throw HttpError.serverError();
    }
    return _handleResponse(response);
  }

  Future<Response<dynamic>> _getResponse({
    required RequestMethod method,
    required String url,
    Options? options,
    Map<String, dynamic> queryParameters = const {},
    Map<String, dynamic> body = const {},
  }) {
    if (method == RequestMethod.get) {
      return client.get(url,
          queryParameters: queryParameters, options: options);
    } else if (method == RequestMethod.put) {
      return client.put(url, data: body, options: options);
    } else if (method == RequestMethod.post) {
      return client.post(url, data: body, options: options);
    } else if (method == RequestMethod.patch) {
      return client.patch(url, data: body, options: options);
    } else if (method == RequestMethod.delete) {
      return client.delete(url,
          queryParameters: queryParameters, options: options);
    } else {
      return client.get(url,
          queryParameters: queryParameters, options: options);
    }
  }

  dynamic _handleResponse(Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    } else if (response.statusCode == 204) {
      return [];
    } else if (response.statusCode == 400) {
      throw HttpError.badRequest();
    } else if (response.statusCode == 401) {
      throw HttpError.unauthorized();
    } else if (response.statusCode == 403) {
      throw HttpError.forbidden();
    } else if (response.statusCode == 404) {
      throw HttpError.notFound();
    } else if (response.statusCode == 422) {
      throw HttpError.invalidData();
    } else {
      throw HttpError.serverError();
    }
  }
}
