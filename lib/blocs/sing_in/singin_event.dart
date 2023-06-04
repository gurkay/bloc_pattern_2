part of 'singin_bloc.dart';

abstract class SinginEvent {
  const SinginEvent();
}

final class SinginPageEvent extends SinginEvent {
  final String page;

  const SinginPageEvent({required this.page});

  @override
  String toString() => 'SinginPageEvent {page: $page}';
}
