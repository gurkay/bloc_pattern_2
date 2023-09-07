import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum LottiePaths {
  animation_theme_button,
  animation_dots_loader,
}

extension LottiePathsExtension on LottiePaths {
  String toPath() {
    return 'assets/lottie/$name.json';
  }

  Widget toWidget(bool repeat, Animation<double> controller) {
    return LottieBuilder.asset(
      toPath(),
      repeat: repeat,
      controller: controller,
    );
  }

  Widget toDotsWidget(bool repeat) {
    return LottieBuilder.asset(
      toPath(),
      repeat: repeat,
    );
  }
}
