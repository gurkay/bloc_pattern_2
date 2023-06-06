import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final String page;
  NavigationBloc(this.page) : super(NavigationState(page: page));

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is HomePageEvent) {
      yield HomePageState(page: state.page);
    } else if (event is HomeDetailPageEvent) {
      yield HomeDetailPageState(page: state.page);
    } else if (event is TimerViewEvent) {
      yield TimerViewState(page: state.page);
    } else if (event is SinginPageEvent) {
      yield SinginPageState(page: state.page);
    }
  }
}
