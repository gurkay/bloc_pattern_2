import 'package:bloc_pattern_2/bacik/101/list_view_learn.dart';
import 'package:bloc_pattern_2/bacik/demos/basic_demo_father.dart';
import 'package:bloc_pattern_2/bacik/demos/color_demo_view.dart';
import 'package:bloc_pattern_2/bacik/demos/color_life_cycle_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.purple,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        listTileTheme: ListTileThemeData(contentPadding: EdgeInsets.zero),
        cardTheme: const CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
            ),
          ),
        ),
        primaryColor: Colors.amber,
        primaryColorDark: Colors.blueAccent,
        primaryColorLight: Colors.lightBlue,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.red,
        ),
      ),
      home: BasicDemoFather(),
    );
  }
}
