import 'package:dio/dio.dart';

class ProjectNetworkManager {
  late final Dio _dio;

  ProjectNetworkManager._() {
    _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));
  }

  static ProjectNetworkManager instance = ProjectNetworkManager._();

  Dio get serviceManager => _dio;

  void addBaseOptionHeaderToToken(String token) {
    _dio.options = _dio.options.copyWith(
      headers: {
        "Authorization": token,
      },
    );
  }
}
