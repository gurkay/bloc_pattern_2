import 'package:flutter/material.dart';

class TabLearn extends StatefulWidget {
  const TabLearn({super.key});

  @override
  State<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabLearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _notchMargin = 10;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabViews.values.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: _myAppBarTabView(),
        ),
        body: _tabBarView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _tabController.animateTo(_MyTabViews.favorite.index);
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        extendBody: true,
        bottomNavigationBar: BottomAppBar(
          notchMargin: _notchMargin,
          shape: const CircularNotchedRectangle(),
          child: _myBottomTabView(),
        ),
      ),
    );
  }

  TabBar _myAppBarTabView() {
    return TabBar(
      labelPadding: _MyTabBarPaddingUtility().onlyButtomTop,
      controller: _tabController,
      tabs: _MyTabViews.values.map((e) => Tab(text: '${e.name}')).toList(),
    );
  }

  TabBar _myBottomTabView() {
    return TabBar(
      onTap: (value) {
        print(value);
      },
      labelPadding: _MyTabBarPaddingUtility().onlyButtomTop,
      controller: _tabController,
      tabs: _MyTabViews.values.map((e) => Tab(text: '${e.name}')).toList(),
    );
  }

  TabBarView _tabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        Container(
          color: Colors.blue,
        ),
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.yellow,
        ),
      ],
    );
  }
}

class _MyTabBarPaddingUtility {
  final EdgeInsets onlyButtomTop = const EdgeInsets.only(bottom: 20, top: 10);
}

class _TabBarPages {
  final Text appBarPage1 = Text('Page1');
  final Text appBarPage2 = Text('Page2');
  final Text bottomNavBarPage3 = Text('Page3');
  final Text bottomNavBarPage4 = Text('Page4');
}

enum _MyTabViews { home, settings, favorite, profile }

extension _MyTabViewExtension on _MyTabViews {}
