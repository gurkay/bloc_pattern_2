import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final String title;
  final Future<void> Function() onPressed;

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool _isLoading = false;

  void _changeIsLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (_isLoading) return;
        _changeIsLoading();
        await widget.onPressed.call();
        _changeIsLoading();
      },
      child: _isLoading
          ? const CircularProgressIndicator(
              backgroundColor: Colors.white,
            )
          : Text(widget.title),
    );
  }
}
