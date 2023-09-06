part of 'theme_bloc.dart';

class ThemeState {
  String name;
  ThemeData changeTheme;
  bool isDarkTheme = true;

  ThemeState(this.name, this.changeTheme, this.isDarkTheme);
}
