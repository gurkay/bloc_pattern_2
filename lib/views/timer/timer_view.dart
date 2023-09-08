import 'package:bloc_pattern_2/blocs/timer/timer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utilities/timer/ticker.dart';
import '../../widgets/timer/timer_actions.dart';
import '../../widgets/timer/background.dart';
import '../../widgets/timer/timer_text.dart';

class TimerView extends StatelessWidget {
  const TimerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerBloc(ticker: const Ticker()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Flutter Timer View')),
        body: const Stack(
          children: [
            Background(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 100.0),
                  child: Center(
                    child: TimerText(),
                  ),
                ),
                TimerActions(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
