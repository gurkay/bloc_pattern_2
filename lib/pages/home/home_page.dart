import 'package:bloc_pattern_2/blocs/navigation/nav_drawer/nav_drawer_bloc.dart';
import 'package:bloc_pattern_2/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/sing_in/singin_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final singinBloc = BlocProvider.of<SinginBloc>(context);
    return BlocBuilder<NavDrawerBloc, NavDrawerState>(
      builder: (BuildContext context, NavDrawerState state) => Scaffold(
        drawer: NavDrawerWidget('Gurkay BAŞYİĞİT', 'gunesebak@gmail.com'),
        appBar: AppBar(
          title: const Text('Home Page 1'),
        ),
        body: BlocListener<SinginBloc, SinginState>(
          listener: (context, state) {
            print('HomePage:::listener:::${state.page}');
            Navigator.of(context).pushNamed(state.page);
          },
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                singinBloc.add(SinginPageEvent(page: AppRoutes.Sing_in));
              },
              child: Text('Sing In'),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavigationItem {
  final bool header;
  final NavItem? item;
  final String? title;
  final IconData? icon;

  _NavigationItem(this.header, this.item, this.title, this.icon);
}

class NavDrawerWidget extends StatelessWidget {
  final String accountName;
  final String accountEmail;
  NavDrawerWidget(this.accountName, this.accountEmail, {super.key});

  final List<_NavigationItem> _listItems = [
    _NavigationItem(true, null, null, null),
    _NavigationItem(false, NavItem.page_one, "First Page", Icons.looks_one),
    _NavigationItem(false, NavItem.page_two, "Second Page", Icons.looks_two),
    _NavigationItem(false, NavItem.page_three, "Third Page", Icons.looks_3),
    _NavigationItem(false, NavItem.page_four, "Fourth Page", Icons.looks_4),
    _NavigationItem(false, NavItem.page_five, "Fifth Page", Icons.looks_5),
    _NavigationItem(false, NavItem.page_six, "Sixth Page", Icons.looks_6),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue[300],
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: _listItems.length,
          itemBuilder: (BuildContext context, int index) =>
              BlocBuilder<NavDrawerBloc, NavDrawerState>(
            builder: (BuildContext context, NavDrawerState state) =>
                _buildItems(_listItems[index], state),
          ),
        ),
      ),
    );
  }

  Widget _buildItems(_NavigationItem data, NavDrawerState state) =>
      data.header ? _makeHeaderItem() : _makeListItem(data, state);
  Widget _makeHeaderItem() => UserAccountsDrawerHeader(
        accountName:
            Text(accountName, style: const TextStyle(color: Colors.white)),
        accountEmail:
            Text(accountEmail, style: const TextStyle(color: Colors.white)),
        decoration: const BoxDecoration(color: Colors.blueGrey),
        currentAccountPicture: const CircleAvatar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.amber,
          child: Icon(
            Icons.person,
            size: 54,
          ),
        ),
      );
  Widget _makeListItem(_NavigationItem data, NavDrawerState state) => Card(
        color: data.item == state.selectedItem ? Colors.amber : Colors.pink,
        shape: const ContinuousRectangleBorder(borderRadius: BorderRadius.zero),
        // So we see the selected highlight
        borderOnForeground: true,
        elevation: 0,
        margin: EdgeInsets.zero,
        child: Builder(
          builder: (BuildContext context) => ListTile(
            title: Text(
              '${data.title}',
              style: TextStyle(
                color: data.item == state.selectedItem
                    ? Colors.blue
                    : Colors.blueGrey,
              ),
            ),
            leading: Icon(
              data.icon,
              // if it's selected change the color
              color: data.item == state.selectedItem
                  ? Colors.blue
                  : Colors.blueGrey,
            ),
            onTap: () => _handleItemClick(context, data.item),
          ),
        ),
      );
  void _handleItemClick(BuildContext context, NavItem item) {
    BlocProvider.of<NavDrawerBloc>(context).add(NavigateToEvent(item));
    Navigator.pop(context);
  }
}
