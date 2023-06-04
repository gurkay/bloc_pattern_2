part of 'home_bloc.dart';

abstract class HomeEvent {}

class HomePageEvent extends HomeEvent {}

class HomeDetailPageEvent extends HomeEvent {}

class TimerViewEvent extends HomeEvent {}

class PageChanged extends HomeEvent {}
