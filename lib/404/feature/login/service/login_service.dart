import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../product/model/token_model.dart';
import '../model/login_model.dart';

abstract class ILoginService {
  final Dio dio;

  ILoginService(this.dio);
  Future<dynamic> login(LoginModel model);
  final _loginPath = 'api/login';
}

class LoginService extends ILoginService {
  LoginService(Dio dio) : super(dio);

  @override
  Future<dynamic> login(LoginModel model) async {
    if (kDebugMode) {
      print('response.data : ${model.toJson()}');
    }
    final response = await dio.post<dynamic>('api/login', data: model.toJson());

    return response.data;
  }
}
