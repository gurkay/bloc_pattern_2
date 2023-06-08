part of 'nav_drawer_bloc.dart';

class NavDrawerState extends Equatable {
  final NavItem? selectedItem;
  const NavDrawerState(this.selectedItem);
  @override
  List<Object?> get props => [selectedItem];

  @override
  String toString() =>
      'toString:::NavDrawerState:::> selectedItem $selectedItem';
}
