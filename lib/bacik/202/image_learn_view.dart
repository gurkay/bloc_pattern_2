import 'package:flutter/material.dart';

class ImageLearnView extends StatefulWidget {
  const ImageLearnView({super.key});

  @override
  State<ImageLearnView> createState() => _ImageLearnViewState();
}

class _ImageLearnViewState extends State<ImageLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ImagePaths.ic_apple_with_scholl.toWidget(),
    );
  }
}

enum ImagePaths {
  ic_apple_with_scholl,
}

extension ImagePathsExtension on ImagePaths {
  String toPath() {
    return 'assets/png/$name.png';
  }

  Widget toWidget() {
    return Image.asset(toPath());
  }
}
