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
  late AnimationController _animationController;
  bool _isDarkTheme = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: DurationItems.durationNormal());
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
          body: _inWellThemeButton(context, state),
        );
      },
    );
  }

  InkWell _inWellThemeButton(BuildContext context, ThemeState state) {
    IThemeManager themeManager = ThemeManager();

    return InkWell(
      onTap: () {
        state.isDarkTheme
            ? themeManager.lightTheme(context)
            : themeManager.darkTheme(context);
        _isDarkTheme = !_isDarkTheme;
        _animationController.animateTo(_isDarkTheme ? 1.00 : 0.50);
      },
      child: LottiePaths.animation_theme_button.toWidget(
        false,
        _animationController,
      ),
    );
  }
}
