import 'package:bloc_pattern_2/bacik/202/animated_learn_view.dart';
import 'package:bloc_pattern_2/bacik/202/cache/shared_learn_view.dart';
import 'package:bloc_pattern_2/bacik/202/form_learn_view.dart';
import 'package:bloc_pattern_2/bacik/202/sheet_learn_view.dart';
import 'package:bloc_pattern_2/bacik/202/state_manage/state_manage_learn_view.dart';
import 'package:bloc_pattern_2/bacik/202/theme/light_theme.dart';
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
      home: SheetLearnView(),
    );
  }
}
