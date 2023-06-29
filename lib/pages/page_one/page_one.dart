import 'package:flutter/material.dart';

import '../../blocs/bloc_exports.dart';
import '../../routes/app_routes.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});
  @override
  Widget build(BuildContext context) {
    final initialPageBloc = BlocProvider.of<InitialPageBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page One'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            initialPageBloc.add(FirstInitialPageEvent());
            Navigator.pushNamed(context, AppRoutes.TASKS_SCREEN);
          },
          child: const Text('Go Tasks'),
        ),
      ),
    );
  }
}
