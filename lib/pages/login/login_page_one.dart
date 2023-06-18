import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/login/login_bloc.dart';
import '../../repositories/authentication/authentication_repository.dart';
import '../../views/login/login_form.dart';

class LoginPageOne extends StatelessWidget {
  const LoginPageOne({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPageOne());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) {
            return LoginBloc(
              authenticationRepository:
                  RepositoryProvider.of<AuthenticationRepository>(context),
            );
          },
          child: const LoginForm(),
        ),
      ),
    );
  }
}
