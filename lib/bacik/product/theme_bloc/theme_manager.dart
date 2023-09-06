import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/theme_bloc.dart';

abstract class IThemeManager {
  void lightTheme(BuildContext context);
  void darkTheme(BuildContext context);
}

class ThemeManager extends IThemeManager {
  @override
  void lightTheme(BuildContext context) {
    BlocProvider.of<ThemeBloc>(context).add(LightThemeEvent());
  }

  @override
  void darkTheme(BuildContext context) {
    BlocProvider.of<ThemeBloc>(context).add(DarkThemeEvent());
  }
}
