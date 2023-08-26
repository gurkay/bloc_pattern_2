import 'package:bloc_pattern_2/bacik/101/card_learn.dart';
import 'package:bloc_pattern_2/bacik/101/custom_widget_learn.dart';
import 'package:bloc_pattern_2/bacik/101/image_learn.dart';
import 'package:flutter/material.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({super.key});

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final _pageController = PageController(viewportFraction: 0.7);
  int _currentPageIndex = 1;
  void _updatePageState(int index) {
    setState(() {
      _currentPageIndex = index + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView(
        controller: _pageController,
        onPageChanged: _updatePageState,
        padEnds: false,
        children: [
          CardLearn(),
          CustomWidgetLearn(),
          ImageLearn(),
        ],
      ),
      floatingActionButton: Padding(
        padding: _PaddingUtility._paddingOnlyLeft30,
        child: Row(
          children: [
            Text(_currentPageIndex.toString()),
            const Spacer(),
            FloatingActionButton(
              onPressed: () {
                _pageController.previousPage(
                  duration: _DurationUtility._durationLow,
                  curve: Curves.easeInCirc,
                );
              },
              child: Icon(
                Icons.chevron_left,
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                _pageController.nextPage(
                  duration: _DurationUtility._durationLow,
                  curve: Curves.decelerate,
                );
              },
              child: Icon(
                Icons.chevron_right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DurationUtility {
  static const _durationLow = Duration(seconds: 1);
}

class _PaddingUtility {
  static const _paddingOnlyLeft30 = EdgeInsets.only(left: 30);
}
