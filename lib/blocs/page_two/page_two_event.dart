part of 'page_two_bloc.dart';

abstract class PageTwoEvent {
  const PageTwoEvent();
}

class NavigateToPageTwoEvent extends PageTwoEvent {
  NavigateToPageTwoEvent();

  @override
  String toString() => 'toString:::NavigateToPageTwoEvent:::>';
}
