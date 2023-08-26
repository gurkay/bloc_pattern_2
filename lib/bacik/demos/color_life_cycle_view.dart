import 'package:bloc_pattern_2/bacik/demos/color_demo_view.dart';
import 'package:flutter/material.dart';

class ColorLifeCycleView extends StatefulWidget {
  const ColorLifeCycleView({
    super.key,
  });

  @override
  State<ColorLifeCycleView> createState() => _ColorLifeCycleViewState();
}

class _ColorLifeCycleViewState extends State<ColorLifeCycleView> {
  Color? _backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _changeBackroundColor,
            icon: const Icon(Icons.change_circle),
          ),
        ],
      ),
      body: Column(
        children: [
          Spacer(),
          Expanded(
            child: ColorDemoView(initialColor: _backgroundColor),
          ),
        ],
      ),
    );
  }

  void _changeBackroundColor() {
    setState(() {
      _backgroundColor = Colors.amber;
    });
  }
}
