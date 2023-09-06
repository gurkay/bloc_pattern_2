import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum LottiePaths {
  // ignore: constant_identifier_names
  animation_theme_button,
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
}
