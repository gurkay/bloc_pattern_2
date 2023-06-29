import 'dart:async';

import 'package:bloc_pattern_2/404/feature/login/model/login_model.dart';
import 'package:bloc_pattern_2/404/feature/login/service/login_service.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();
  late ILoginService _iLoginService;

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    final response = await _iLoginService.login(LoginModel(username, password));

    await Future.delayed(const Duration(milliseconds: 300),
        () => _controller.add(AuthenticationStatus.authenticated));
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();

  @override
  String toString() {
    return 'AuthenticationRepository ::: toString ::: _controller : $_controller';
  }
}
