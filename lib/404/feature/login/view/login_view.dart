import 'package:bloc_pattern_2/404/feature/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      create: (_) => LoginBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return state.isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.amberAccent,
                    )
                  : const SizedBox();
            },
          ),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              EmailTextFormField(controller: _emailController),
              PasswordTextFormField(controller: _passwordController),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        context.read<LoginBloc>().checkUser(
                              _emailController.text,
                              _passwordController.text,
                            );
                      }
                    },
                    child: state.loginModel?.email == null
                        ? const Text('Submit')
                        : Text('Submit - ${state.loginModel?.email}'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmailTextFormField extends StatelessWidget {
  final TextEditingController controller;
  const EmailTextFormField({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.all(),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.always,
        controller: controller,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          hintText: 'e-mail',
        ),
        validator: (value) {
          if (value!.isEmpty ||
              !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
            return 'Enter correct email adress';
          } else {
            return null;
          }
        },
      ),
    );
  }
}

class PasswordTextFormField extends StatelessWidget {
  final TextEditingController controller;
  const PasswordTextFormField({
    super.key,
    required this.controller,
  });

  final _obsureText = '*';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.all(),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return TextFormField(
            autovalidateMode: AutovalidateMode.always,
            controller: controller,
            autofillHints: const [AutofillHints.password],
            keyboardType: TextInputType.visiblePassword,
            obscureText: !state.isSecurePassword,
            obscuringCharacter: _obsureText,
            decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                hintText: 'password',
                suffix: IconButton(
                  onPressed: () {
                    context
                        .read<LoginBloc>()
                        .isSecurePassword(!state.isSecurePassword);
                  },
                  icon: AnimatedCrossFade(
                    firstChild: const Icon(Icons.visibility_outlined),
                    secondChild: const Icon(Icons.visibility_off_outlined),
                    duration: const Duration(microseconds: 200),
                    crossFadeState: state.isSecurePassword
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                  ),
                )),
            validator: (value) {
              if (value!.isEmpty ||
                  !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$')
                      .hasMatch(value)) {
                return 'Enter correct password adress';
              } else {
                return null;
              }
            },
          );
        },
      ),
    );
  }
}

class PagePadding extends EdgeInsets {
  PagePadding.all() : super.all(20);
}
