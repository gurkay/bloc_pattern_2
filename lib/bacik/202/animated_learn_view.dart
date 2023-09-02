import 'package:flutter/material.dart';

class AnimatedLearnView extends StatefulWidget {
  const AnimatedLearnView({super.key});

  @override
  State<AnimatedLearnView> createState() => _AnimatedLearnViewState();
}

class _AnimatedLearnViewState extends State<AnimatedLearnView> {
  bool _isVisible = true;
  bool _isOpasity = true;

  void _changeIsVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _changeIsOpasity() {
    setState(() {
      _isOpasity = !_isOpasity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _Animates()._animatedCrossFade(
          _isVisible,
          const Text('Title'),
          const SizedBox.shrink(),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: _Animates()._animatedOpacity(
              _isOpasity,
              const Text('List Tile Title'),
            ),
            trailing: IconButton(
              onPressed: () {
                _changeIsOpasity();
              },
              icon: const Icon(Icons.refresh),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _changeIsVisible();
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
