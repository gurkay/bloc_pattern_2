import 'package:bloc_pattern_2/404/feature/login/model/login_model.dart';
import 'package:bloc_pattern_2/404/feature/login/service/login_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late LoginService loginService;

  setUp(() {
    loginService =
        LoginService(Dio(BaseOptions(baseUrl: 'https://reqres.in/')));
  });

  test('Login Test email : eve.holt@reqres.in & password : cityslicka',
      () async {
    final response = await loginService
        .login(LoginModel('eve.holt@reqres.in', 'cityslicka'));
    expect(response!.token, isNull);
  });
}
