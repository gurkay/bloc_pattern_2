import 'package:dio/dio.dart';

abstract class IDioNetworkManager {}

class DioNetworkManager extends IDioNetworkManager {
  DioNetworkManager() : super();

  static Dio baseOption() {
    return Dio(BaseOptions(baseUrl: 'https://reqres.in/'));
  }
}
