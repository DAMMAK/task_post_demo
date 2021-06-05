import 'package:demotask/config/app_config.dart';
import 'package:dio/dio.dart';

class PostService {
  Dio _dio;

  // setting the baseUrl for the jsonplaceholder server
  final String _baseUrl = AppConfig.baseUrl;

  PostService() {
    _dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
    ));
  }

  // Get All Posts data from https://jsonplaceholder.typicode.com/post
  Future<Response> getPost() {
    return _dio.get(AppConfig.getPostUrl);
  }
}

/*
adding [isSuccessful] prop to Response which allows to check if network request was successful
 */
extension ResponseExt on Response {
  bool get isSuccessful => statusCode >= 200 && statusCode < 300;
}
