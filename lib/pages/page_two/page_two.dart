import 'package:flutter/material.dart';

import '../../blocs/bloc_exports.dart';
import '../../routes/app_routes.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Two'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.TASKS_SCREEN);
          },
          child: const Text('Go Tasks'),
        ),
      ),
    );
  }
}
