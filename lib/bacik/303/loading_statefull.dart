import 'package:flutter/material.dart';

mixin LoadingStatefull<T extends StatefulWidget> on State<T> {
  bool isLoading = false;

  void changeIsLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
