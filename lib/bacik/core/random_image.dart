import 'package:flutter/material.dart';

class RandomImage extends StatelessWidget {
  const RandomImage({
    super.key,
    this.imageUrl = 'https://picsum.photos/seed/picsum/200/300',
    this.imageHeight = 100,
  });
  final String? imageUrl;
  final double imageHeight;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl ?? '',
      height: imageHeight,
      fit: BoxFit.cover,
    );
  }
}
