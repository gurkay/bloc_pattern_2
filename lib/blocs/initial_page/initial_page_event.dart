part of 'initial_page_bloc.dart';

abstract class InitialPageEvent {
  const InitialPageEvent();
}

class FirstInitialPageEvent extends InitialPageEvent {
  const FirstInitialPageEvent();

  @override
  String toString() =>
      'FirstInitialPageEventEvent {page: FirstInitialPageEvent}';
}
