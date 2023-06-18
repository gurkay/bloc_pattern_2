import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../product/model/token_model.dart';
import '../model/login_model.dart';

class LoginService {
  final Dio dio;

  LoginService(this.dio);

  Future<TokenModel?> login(LoginModel model) async {
    if (kDebugMode) {
      print('response.data : ${model}');
    }
    final response = await dio.post<TokenModel>('api/login',
        data: model, queryParameters: model.toJson());

    return response.data;
  }
}
