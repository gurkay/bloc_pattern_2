import 'package:bloc_pattern_2/bacik/202/theme/light_theme.dart';
import 'package:bloc_pattern_2/bacik/303/call_back_learn.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test',
      theme: LightTheme().theme,
      home: CallBackLearn(),
    );
  }
}
