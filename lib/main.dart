import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/timer/timer_bloc.dart';
import 'utilities/timer/ticker.dart';
import 'views/timer/timer_view.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Timer',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(109, 234, 255, 1),
        colorScheme: const ColorScheme.light(
          brightness: Brightness.light,
          primary: Color.fromRGBO(109, 234, 255, 1),
          onPrimary: Colors.white,
          secondary: Color.fromRGBO(119, 204, 255, 1),
          onSecondary: Colors.lightBlue,
          error: Color.fromRGBO(187, 14, 14, 1),
          onError: Colors.red,
          background: Colors.amberAccent,
          onBackground: Colors.amber,
          surface: Colors.white,
          onSurface: Colors.white24,
        ),
      ),
      home: const TimerPage(),
    );
  }
}

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerBloc(ticker: const Ticker()),
      child: const TimerView(),
    );
  }
}
