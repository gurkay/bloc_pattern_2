part of 'page_one_bloc.dart';

abstract class PageOneEvent {
  const PageOneEvent();
}

class NavigateToPageOneEvent extends PageOneEvent {
  NavigateToPageOneEvent();

  @override
  String toString() => 'toString:::NavigateToPageOneEvent:::>';
}
