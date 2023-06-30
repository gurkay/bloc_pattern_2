import 'package:bloc_pattern_2/login_prj/login/models/login_model.dart';
import 'package:dio/dio.dart';

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
    try {
      final response =
          await dio.post<dynamic>(_loginPath, data: model.toJson());
      return response.data;
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(
            'LoginService ::: login ::: e.response.data : ${e.response?.data}');
        print(
            'LoginService ::: login ::: e.response.headers : ${e.response?.headers}');
        print(
            'LoginService ::: login ::: e.response.requestOptions : ${e.response?.requestOptions}');
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(
            'LoginService ::: login ::: e.response.requestOptions : ${e.requestOptions}');
        print('LoginService ::: login ::: e.response.message : ${e.message}');
      }
    }
  }
}
