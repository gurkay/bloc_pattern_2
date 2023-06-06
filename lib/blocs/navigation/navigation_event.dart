part of 'navigation_bloc.dart';

abstract class NavigationEvent {
  const NavigationEvent();
}

class HomePageEvent extends NavigationEvent {}

class HomeDetailPageEvent extends NavigationEvent {}

class TimerViewEvent extends NavigationEvent {}

final class SinginPageEvent extends NavigationEvent {
  final String page;

  const SinginPageEvent({required this.page});

  @override
  String toString() => 'SinginPageEvent {page: $page}';
}
