import 'package:flutter/material.dart';

class WidgetSizesEnumView extends StatefulWidget {
  const WidgetSizesEnumView({super.key});

  @override
  State<WidgetSizesEnumView> createState() => _WidgetSizesEnumViewState();
}

class _WidgetSizesEnumViewState extends State<WidgetSizesEnumView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card(
        child: Container(
          height: WidgetSizes.normalCardHeight.value(),
          color: Colors.red,
        ),
      ),
    );
  }
}

enum WidgetSizes {
  normalCardHeight,
  circleProfileWidth,
}

extension WidgetSizesExtension on WidgetSizes {
  double value() {
    switch (this) {
      case WidgetSizes.normalCardHeight:
        return 30;
      case WidgetSizes.circleProfileWidth:
        return 40;
    }
  }
}
