import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  const PasswordTextField({super.key, this.controller});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final String _obscuringCharacter = '#';
  bool _isSecure = true;

  void _changeIsSecure() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      autofillHints: [AutofillHints.password],
      keyboardType: TextInputType.visiblePassword,
      obscureText: _isSecure,
      obscuringCharacter: _obscuringCharacter,
      decoration: _inputDecoration(),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      hintText: 'Password',
      suffix: _iconButton(),
    );
  }

  IconButton _iconButton() {
    return IconButton(
      icon: Icon(_isSecure ? Icons.visibility_off : Icons.visibility),
      onPressed: () {
        _changeIsSecure();
      },
    );
  }
}
