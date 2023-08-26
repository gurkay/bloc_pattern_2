import 'dart:developer';

import 'package:flutter/material.dart';

class ColorDemoView extends StatefulWidget {
  const ColorDemoView({
    super.key,
    this.initialColor,
  });
  final Color? initialColor;
  @override
  State<ColorDemoView> createState() => _ColorDemoViewState();
}

class _ColorDemoViewState extends State<ColorDemoView> {
  Color? _backgroundColor;

  @override
  void didUpdateWidget(covariant ColorDemoView oldWidget) {
    inspect(oldWidget);
    if (widget.initialColor != _backgroundColor &&
        widget.initialColor != null) {
      changeBackgroundColor(widget.initialColor!);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    _backgroundColor = widget.initialColor ?? Colors.white;
    super.initState();
  }

  void changeBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: _backgroundColor,
      bottomNavigationBar: _BottomNavigationBar(
        callbackVoidFunction: changeBackgroundColor,
      ),
    );
  }
}

enum _MyColors { red, green, blue }

class _BottomNavigationBar extends StatelessWidget {
  _BottomNavigationBar({
    required this.callbackVoidFunction,
  });
  final void Function(Color) callbackVoidFunction;
  final _labelBlue = 'Blue';
  final _labelGreen = 'Green';
  final _labelRed = 'Red';
  final _containerRed = Container(
    height: 8,
    color: Colors.red,
  );
  final _containerGreen = Container(
    height: 8,
    color: Colors.green,
  );
  final _containerBlue = Container(
    height: 8,
    color: Colors.blue,
  );
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: _colorOnTap,
      items: [
        _bottomNavigationBarItem(
          _containerRed,
          _labelRed,
        ),
        _bottomNavigationBarItem(
          _containerGreen,
          _labelGreen,
        ),
        _bottomNavigationBarItem(
          _containerBlue,
          _labelBlue,
        ),
      ],
    );
  }

  void _colorOnTap(int value) {
    if (value == _MyColors.red.index) {
      callbackVoidFunction(Colors.red);
    } else if (value == _MyColors.green.index) {
      callbackVoidFunction(Colors.green);
    } else if (value == _MyColors.blue.index) {
      callbackVoidFunction(Colors.blue);
    }
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
    Container container,
    String label,
  ) {
    final _container = container;
    final _label = label;

    return BottomNavigationBarItem(
      icon: _container,
      label: _label,
    );
  }
}
