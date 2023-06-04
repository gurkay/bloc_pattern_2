part of 'singin_bloc.dart';

abstract class SinginState extends Equatable {
  final String page;
  const SinginState({required this.page});

  @override
  List<Object> get props => [page];
}

final class SinginPageState extends SinginState {
  const SinginPageState({required super.page});

  @override
  String toString() => 'SinginPageState {page: $page}';
}
