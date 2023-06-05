import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/timer/timer_bloc.dart';
import '../../utilities/timer/ticker.dart';
import '../../views/timer/timer_view.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TimerBloc>(
          create: (_) => TimerBloc(ticker: const Ticker()),
        ),
      ],
      child: const TimerView(),
    );
  }
}
