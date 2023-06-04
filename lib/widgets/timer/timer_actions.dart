import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/timer/timer_bloc.dart';
import 'state_button.dart';

class TimerActions extends StatelessWidget {
  const TimerActions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        if (kDebugMode) {
          print('Actions state : $state');
          print('Actions state.duration : ${state.duration}');
          print(state.props);
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StateButton(state: state),
          ],
        );
      },
    );
  }
}
