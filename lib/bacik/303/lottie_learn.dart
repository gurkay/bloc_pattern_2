import 'package:bloc_pattern_2/bacik/product/constants/duration_items.dart';
import 'package:bloc_pattern_2/bacik/product/theme_bloc/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../product/extension/lottie_paths_extension.dart';
import '../product/theme_bloc/bloc/theme_bloc.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({super.key});

  @override
  State<LottieLearn> createState() => _LottieLearnState();
}

class _LottieLearnState extends State<LottieLearn>
    with TickerProviderStateMixin {
  late AnimationController _animationThemeController;
  late AnimationController _animationDotsController;

  final double _darkThemeButtonValue = 1.00;
  final double _lightThemeButtonValue = 0.50;

  @override
  void initState() {
    super.initState();
    _animationThemeController = AnimationController(
      vsync: this,
      duration: DurationItems.durationNormal(),
    );
  }

  void _animateThemeTo(double value) {
    _animationThemeController.animateTo(value);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              _inWellThemeButton(context, state),
            ],
          ),
          body: Center(
            child: LottiePaths.animation_dots_loader.toDotsWidget(true),
          ),
        );
      },
    );
  }

  InkWell _inWellThemeButton(BuildContext context, ThemeState state) {
    IThemeManager themeManager = ThemeManager();

    return InkWell(
      onTap: () {
        switch (state.themeName) {
          case 'initial':
            themeManager.lightTheme(context);
            _animateThemeTo(_lightThemeButtonValue);
          case 'dark':
            themeManager.lightTheme(context);
            _animateThemeTo(_lightThemeButtonValue);
          case 'light':
            themeManager.darkTheme(context);
            _animateThemeTo(_darkThemeButtonValue);
        }
      },
      child: LottiePaths.animation_theme_button.toWidget(
        false,
        _animationThemeController,
      ),
    );
  }
}
