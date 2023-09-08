import 'package:bloc_pattern_2/bacik/product/models/dummy_families.dart';
import 'package:bloc_pattern_2/constants/title_screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreenRouteLearn extends StatelessWidget {
  const HomeScreenRouteLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                context.go(
                  context.namedLocation(
                    'second_screen',
                  ),
                );
              },
              child: const Text(TitleScreen.second_screen),
            ),
            ElevatedButton(
              onPressed: () {
                context.go(
                  context.namedLocation(
                    'dynamic_text_field',
                  ),
                );
              },
              child: const Text('Dynamic Text Field'),
            ),
            ElevatedButton(
              onPressed: () {
                context.go(
                  context.namedLocation(
                    'timer_view',
                  ),
                );
              },
              child: const Text('Timer'),
            ),
          ],
        ),
      ),
    );
  }
}
