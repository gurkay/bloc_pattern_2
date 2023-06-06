part of 'navigation_bloc.dart';

class NavigationState extends Equatable {
  final String page;
  const NavigationState({required this.page});

  @override
  List<Object> get props => [page];
}

final class SinginPageState extends NavigationState {
  const SinginPageState({required super.page});

  @override
  String toString() => 'SinginPageState {page: ${props.toList()}}';
}

class HomePageState extends NavigationState {
  HomePageState({required super.page});
}

class HomeDetailPageState extends NavigationState {
  HomeDetailPageState({required super.page});
}

class TimerViewState extends NavigationState {
  TimerViewState({required super.page});
}
