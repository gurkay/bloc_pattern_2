import 'package:bloc_pattern_2/bacik/101/card_learn.dart';
import 'package:bloc_pattern_2/bacik/101/image_learn.dart';
import 'package:bloc_pattern_2/bacik/101/list_view_learn.dart';
import 'package:bloc_pattern_2/bacik/101/navigation_detail_learn.dart';
import 'package:bloc_pattern_2/bacik/101/page_view_learn.dart';
import 'package:flutter/material.dart';

class NavigationLearn extends StatefulWidget {
  const NavigationLearn({super.key});

  @override
  State<NavigationLearn> createState() => _NavigationLearnState();
}

class _NavigationLearnState extends State<NavigationLearn>
    with NavigatorManager {
  final _PaddingUtility _paddingUtility = _PaddingUtility();
  List<int> selectedItems = [];

  void addSelected(int index, bool isAdd) {
    setState(() {
      isAdd ? selectedItems.add(index) : selectedItems.remove(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            color: selectedItems.contains(index) ? Colors.green : Colors.amber,
            shape: const StadiumBorder(),
            child: Container(
              height: 100,
              child: Padding(
                padding: EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () async {
                        final response = await navigatorToWidgetNormal<bool>(
                            context,
                            NavigationDetailLearn(
                                isOk: selectedItems.contains(index)),
                            false);
                        if (response is bool) {
                          addSelected(index, response);
                        }
                      },
                      child: Icon(Icons.navigate_next),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: 5,
      ),
      bottomNavigationBar: Padding(
        padding: _paddingUtility.all,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                navigatorToWidget(context, ListViewLearn(), true);
              },
              icon: Icon(Icons.navigation_outlined),
            ),
            IconButton(
              onPressed: () {
                navigatorToWidget(context, NavigationDetailLearn(), true);
              },
              icon: Icon(Icons.navigation_rounded),
            ),
            IconButton(
              onPressed: () {
                navigatorToWidget(context, ListViewLearn(), false);
              },
              icon: Icon(Icons.navigate_next),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaddingUtility {
  final EdgeInsets all = const EdgeInsets.all(20.0);
}

// constructor olmayan class
// interface görevi görür
mixin NavigatorManager {
  void navigatorToWidget(
    BuildContext context,
    Widget widget,
    bool fullScreenDialog,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return widget;
        },
        fullscreenDialog: fullScreenDialog,
      ),
    );
  }

  Future<T?> navigatorToWidgetNormal<T>(
    BuildContext context,
    Widget widget,
    bool fullScreenDialog,
  ) {
    return Navigator.of(context).push<T>(
      MaterialPageRoute(
        builder: (context) {
          return widget;
        },
        fullscreenDialog: fullScreenDialog,
      ),
    );
  }
}
