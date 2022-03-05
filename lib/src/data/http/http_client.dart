abstract class HttpClient {
  Future request({
    required String url,
    required RequestMethod method,
    Map<String, dynamic> queryParameters = const {},
    Map<String, dynamic> body = const {},
    Map<String, dynamic> headers = const {},
  });
}

enum RequestMethod {
  get,
  put,
  post,
  patch,
  delete,
}
