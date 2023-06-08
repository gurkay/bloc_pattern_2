part of 'nav_drawer_bloc.dart';

abstract class NavDrawerEvent {
  const NavDrawerEvent();
}

class NavigateToEvent extends NavDrawerEvent {
  final NavItem? destination;
  NavigateToEvent(this.destination);

  @override
  String toString() =>
      'toString:::NavigateToEvent:::> selectedItem $destination';
}
