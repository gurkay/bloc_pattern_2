import 'package:bloc_pattern_2/bacik/product/counter_hello_button.dart';
import 'package:bloc_pattern_2/bacik/product/language/language_items.dart';
import 'package:flutter/material.dart';

class StatefullLearn extends StatefulWidget {
  const StatefullLearn({super.key});

  @override
  State<StatefullLearn> createState() => _StatefullLearnState();
}

class _StatefullLearnState extends State<StatefullLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LanguageItems.welcomeTitle),
      ),
      body: const Column(
        children: [
          Center(
            child: Text('data'),
          ),
          CounterHelloButton(),
        ],
      ),
    );
  }
}
