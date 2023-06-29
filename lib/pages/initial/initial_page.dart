import 'package:bloc_pattern_2/pages/splash/splash_page.dart';
import 'package:bloc_pattern_2/routes/app_routes.dart';
import 'package:flutter/material.dart';

import '../../blocs/bloc_exports.dart';
import '../../views/login/login_page.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  late final AuthenticationRepository _authenticationRepository;
  late final UserRepository _userRepository;
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  void initState() {
    super.initState();
    _authenticationRepository = AuthenticationRepository();
    _userRepository = UserRepository();
  }

  @override
  void dispose() {
    _authenticationRepository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('AppView:::');

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        print(state.status);
        switch (state.status) {
          case AuthenticationStatus.authenticated:
            Navigator.pushNamed(context, AppRoutes.HOME);
          case AuthenticationStatus.unauthenticated:
            _navigator.pushAndRemoveUntil<void>(
              LoginPage.route(),
              (route) => false,
            );
          case AuthenticationStatus.unknown:
            Navigator.pushNamed(context, AppRoutes.PAGE_TWO);
            break;
        }
      },
      child: Text('${context} :: '),
    );
  }
}
