import 'package:flutter/material.dart';

class LightTheme {
  final _lightColors = _LightColors();
  late ThemeData theme;

  LightTheme() {
    theme = ThemeData(
      appBarTheme: const AppBarTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20.0),
          ),
        ),
      ),
      scaffoldBackgroundColor: Colors.white12.withOpacity(0.7),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.blueAccent,
      ),
      textTheme: ThemeData.light().textTheme.copyWith(
            titleLarge: TextStyle(
              fontSize: 25,
              color: _lightColors._textColor,
            ),
          ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(Color.fromARGB(255, 224, 210, 14)),
        checkColor: MaterialStateProperty.all(Colors.black),
        side: BorderSide(color: Colors.red),
      ),
      buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme.light(
          onPrimary: _lightColors._blueMenia,
          onSecondary: Colors.purpleAccent,
        ),
      ),
      colorScheme: ColorScheme.light(),
    );
  }
}

class _LightColors {
  final Color _textColor = const Color.fromARGB(255, 225, 18, 18);
  final Color _blueMenia = const Color.fromARGB(95, 188, 248, 1);
}
