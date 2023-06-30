import 'dart:async';

import 'package:bloc_pattern_2/404/service/dio_network_manager.dart';
import 'package:bloc_pattern_2/login_prj/login/models/login_model.dart';
import 'package:bloc_pattern_2/login_prj/services/login_service.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthStatus>();
  late ILoginService _iLoginService;

  Stream<AuthStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    _iLoginService = LoginService(DioNetworkManager.baseOption());
    final response = await _iLoginService.login(LoginModel(email, password));

    if (response != null) {
      await Future.delayed(
        const Duration(milliseconds: 300),
        () => _controller.add(AuthStatus.authenticated),
      );
    }
  }

  void logOut() {
    _controller.add(AuthStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
