import 'package:bloc_pattern_2/bacik/202/state_manage/state_manage_learn_view_model.dart';
import 'package:flutter/material.dart';

class StateManageLearnView extends StatefulWidget {
  const StateManageLearnView({super.key});

  @override
  State<StateManageLearnView> createState() => _StateManageLearnViewState();
}

class _StateManageLearnViewState extends StateManageLearnViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _Animates()._animatedCrossFade(
          isVisible,
          const Text('Title'),
          const SizedBox.shrink(),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: _Animates()._animatedOpacity(
              isOpasity,
              const Text('List Tile Title'),
            ),
            trailing: IconButton(
              onPressed: () {
                changeIsOpasity();
              },
              icon: const Icon(Icons.refresh),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeIsVisible();
        },
      ),
    );
  }
}

class _Animates {
  AnimatedOpacity _animatedOpacity(bool isOpasity, Widget widget) {
    return AnimatedOpacity(
      opacity: isOpasity ? 1 : 0,
      duration: _Duration()._secondLow,
      child: widget,
    );
  }

  AnimatedCrossFade _animatedCrossFade(
    bool isVisible,
    Widget firstWidget,
    Widget secondWidget,
  ) {
    return AnimatedCrossFade(
      firstChild: firstWidget,
      secondChild: secondWidget,
      crossFadeState:
          isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: _Duration()._secondLow,
    );
  }
}

class _Duration {
  final Duration _secondLow = const Duration(seconds: 1);
}
