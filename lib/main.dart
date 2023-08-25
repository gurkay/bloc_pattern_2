import 'package:bloc_pattern_2/bacik/101/app_bar_view.dart';
import 'package:bloc_pattern_2/bacik/101/button_learn.dart';
import 'package:bloc_pattern_2/bacik/101/card_learn.dart';
import 'package:bloc_pattern_2/bacik/101/container_sized_box_learn.dart';
import 'package:bloc_pattern_2/bacik/101/custom_widget_learn.dart';
import 'package:bloc_pattern_2/bacik/101/icon_learn_view.dart';
import 'package:bloc_pattern_2/bacik/101/indicator_learn.dart';
import 'package:bloc_pattern_2/bacik/101/list_tile_learn.dart';
import 'package:bloc_pattern_2/bacik/101/padding_learn.dart';
import 'package:bloc_pattern_2/bacik/101/scaffold_learn_view.dart';
import 'package:bloc_pattern_2/bacik/101/stateless_learn.dart';
import 'package:bloc_pattern_2/bacik/101/text_learn_view.dart';
import 'package:bloc_pattern_2/bacik/demos/note_view.dart';

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
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
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
      home: ListTileLearn(),
    );
  }
}
