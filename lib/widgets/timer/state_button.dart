import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/timer/timer_bloc.dart';

class StateButton extends StatelessWidget {
  final TimerState state;
  const StateButton({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    if (state == TimerInitial(duration: state.duration)) {
      return FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () => context
            .read<TimerBloc>()
            .add(TimerStarted(duration: state.duration)),
      );
    } else if (state == TimerRunInProgress(duration: state.duration)) {
      return Row(
        children: [
          FloatingActionButton(
            child: const Icon(Icons.pause),
            onPressed: () => context.read<TimerBloc>().add(const TimerPaused()),
          ),
          FloatingActionButton(
            child: const Icon(Icons.replay),
            onPressed: () => context.read<TimerBloc>().add(const TimerReset()),
          ),
        ],
      );
    } else if (state == TimerRunPause(duration: state.duration)) {
      return Row(
        children: [
          FloatingActionButton(
            child: const Icon(Icons.play_arrow),
            onPressed: () =>
                context.read<TimerBloc>().add(const TimerResumed()),
          ),
          FloatingActionButton(
            child: const Icon(Icons.replay),
            onPressed: () => context.read<TimerBloc>().add(const TimerReset()),
          ),
        ],
      );
    } else if (state == const TimerRunComplete()) {
      return FloatingActionButton(
        child: const Icon(Icons.replay),
        onPressed: () => context.read<TimerBloc>().add(const TimerReset()),
      );
    }
    return Container();
  }
}
