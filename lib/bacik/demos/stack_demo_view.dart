import 'package:bloc_pattern_2/bacik/core/random_image.dart';
import 'package:flutter/material.dart';

class StackDemoView extends StatelessWidget {
  const StackDemoView({super.key});
  final double _cardHeight = 50.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  bottom: _cardHeight / 2,
                  child: RandomImage(),
                ),
                Positioned(
                  height: _cardHeight,
                  width: 200,
                  bottom: 0,
                  child: Card(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          Spacer(
            flex: 6,
          ),
        ],
      ),
    );
  }
}
