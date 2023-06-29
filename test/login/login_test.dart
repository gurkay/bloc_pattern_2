import 'package:bloc_pattern_2/404/feature/login/model/login_model.dart';
import 'package:bloc_pattern_2/404/feature/login/service/login_service.dart';
import 'package:bloc_pattern_2/404/product/model/token_model.dart';
import 'package:bloc_pattern_2/404/service/dio_network_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ILoginService loginService;
  late TokenModel tokenModel;

  setUp(() {
    loginService = LoginService(DioNetworkManager.baseOption());
  });

  test('Login Test email : eve.holt@reqres.in & password : cityslicka',
      () async {
    final response = await loginService
        .login(LoginModel('eve.holt@reqres.in', 'cityslicka'));
    tokenModel = TokenModel('');

    print(
        'login_test ::: test ::: response: ${tokenModel.fromJson(response).token}');

    expect(tokenModel.fromJson(response).token, 'QpwL5tke4Pnpja7X4');
  });
}
