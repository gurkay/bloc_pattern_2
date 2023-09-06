import 'package:bloc_pattern_2/404/feature/login/bloc/login_bloc.dart';
import 'package:bloc_pattern_2/404/feature/login/service/login_service.dart';
import 'package:bloc_pattern_2/404/service/dio_network_manager.dart';
import 'package:bloc_pattern_2/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/login_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (_) => LoginBloc(LoginService(DioNetworkManager.baseOption())),
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return state.isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.amberAccent,
                    )
                  : state.isCompleted
                      ? const SizedBox()
                      : const Text('Giriş');
            },
          ),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              EmailTextFormField(controller: _emailController),
              PasswordTextFormField(controller: _passwordController),
              SubmitButton(
                formKey: _formKey,
                emailController: _emailController,
                passwordController: _passwordController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

PasswordTextFormField({required TextEditingController controller}) {}

SubmitButton(
    {required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController}) {}

EmailTextFormField({required TextEditingController controller}) {}
