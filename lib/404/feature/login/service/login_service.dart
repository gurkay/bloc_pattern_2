import 'package:dio/dio.dart';

import '../../../product/model/token_model.dart';
import '../model/login_model.dart';

class LoginService {
  final Dio dio;

  LoginService(this.dio);

  Future<TokenModel?> login(LoginModel model) async {
    final response =
        await dio.post<TokenModel>('api/login', data: model.toJson());
    print(response.data);
    return response.data;
  }
}
