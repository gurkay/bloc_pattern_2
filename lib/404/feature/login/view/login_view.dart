import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login View'),
      ),
      body: Form(
        child: Column(
          children: [
            const EmailTextFormField(),
            const PasswordTextFormField(),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.all(),
      child: TextFormField(
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 3,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PagePadding.all(),
      child: TextFormField(
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 3,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}

class PagePadding extends EdgeInsets {
  const PagePadding.all() : super.all(20);
}
