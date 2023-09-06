import 'package:dio/dio.dart';

mixin ProjectDio {
  final String _dioBaseUrl = 'https://reqres.in/api';

  Dio getDio() {
    return Dio(BaseOptions(baseUrl: _dioBaseUrl));
  }
}
