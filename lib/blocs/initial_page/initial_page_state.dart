part of 'initial_page_bloc.dart';

abstract class InitialPageState extends Equatable {
  InitialPageState();

  @override
  List<Object> get props => [];
}

class FirstInitialPageState extends InitialPageState {
  FirstInitialPageState();

  @override
  String toString() => 'FirstInitialPageState {page:FirstInitialPageState}';
}
