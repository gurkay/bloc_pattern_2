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
          title: const Text('Login View'),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              EmailTextFormField(controller: _emailController),
              PasswordTextFormField(controller: _passwordController),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    context.read<LoginBloc>().checkUser(
                        _emailController.text, _passwordController.text);
                  }
                },
                child: const Text('Sent'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmailTextFormField extends StatefulWidget {
  final TextEditingController controller;
  const EmailTextFormField({Key? key, required this.controller})
      : super(key: key);

  @override
  State<EmailTextFormField> createState() => _EmailTextFormFieldState();
}

class _EmailTextFormFieldState extends State<EmailTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.all(),
      child: TextFormField(
        controller: widget.controller,
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

class PasswordTextFormField extends StatefulWidget {
  final TextEditingController controller;
  const PasswordTextFormField({
    super.key,
    required this.controller,
  });

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  final _obsureText = '*';
  bool _isSecure = true;

  void _changeLoading() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.all(),
      child: TextFormField(
        controller: widget.controller,
        autofillHints: const [AutofillHints.password],
        keyboardType: TextInputType.visiblePassword,
        obscureText: _isSecure,
        obscuringCharacter: _obsureText,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          hintText: 'password',
          suffix: _onVisiblityIcon(),
        ),
        validator: (value) {
          if (value!.isEmpty ||
              !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$')
                  .hasMatch(value)) {
            return 'Enter correct password adress';
          } else {
            return null;
          }
        },
      ),
    );
  }

  IconButton _onVisiblityIcon() {
    return IconButton(
      onPressed: _changeLoading,
      icon: AnimatedCrossFade(
        firstChild: const Icon(Icons.visibility_outlined),
        secondChild: const Icon(Icons.visibility_off_outlined),
        duration: const Duration(microseconds: 200),
        crossFadeState:
            _isSecure ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      ),
    );
  }
}

class PagePadding extends EdgeInsets {
  PagePadding.all() : super.all(20);
}
