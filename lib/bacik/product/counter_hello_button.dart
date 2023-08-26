import 'package:bloc_pattern_2/bacik/product/language/language_items.dart';
import 'package:flutter/material.dart';

class CounterHelloButton extends StatefulWidget {
  const CounterHelloButton({super.key});

  @override
  State<CounterHelloButton> createState() => _CounterHelloButtonState();
}

class _CounterHelloButtonState extends State<CounterHelloButton> {
  int _counterCustomValue = 0;
  final String _welcomeTitle = LanguageItems.welcomeTitle;
  void _updateCounterCustomValue() {
    setState(() {
      ++_counterCustomValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _updateCounterCustomValue,
      child: Text('$_welcomeTitle $_counterCustomValue'),
    );
  }
}
