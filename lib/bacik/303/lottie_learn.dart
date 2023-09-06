import 'package:bloc_pattern_2/bacik/product/constants/duration_items.dart';
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
  bool _isLight = false;

  _lightTheme(context) {
    BlocProvider.of<ThemeBloc>(context).add(LightThemeEvent());
  }

  _darkTheme(context) {
    BlocProvider.of<ThemeBloc>(context).add(DarkThemeEvent());
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: DurationItems.durationNormal());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              _isLight ? _lightTheme(context) : _darkTheme(context);
              _animationController.animateTo(_isLight ? 0.50 : 1);
              _isLight = !_isLight;
            },
            child: LottiePaths.animation_theme_button.toWidget(
              false,
              _animationController,
            ),
          ),
        ],
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            _isLight ? _lightTheme(context) : _darkTheme(context);
            _animationController.animateTo(_isLight ? 0.50 : 1);
            _isLight = !_isLight;
          },
          child: LottiePaths.animation_theme_button.toWidget(
            false,
            _animationController,
          ),
        ),
      ),
    );
  }
}
