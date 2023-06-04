import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(HomePageState());

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is HomePageEvent) {
      yield HomePageState();
    } else if (event is HomeDetailPageEvent) {
      yield HomeDetailPageState();
    } else if (event is TimerViewEvent) {
      yield TimerViewState();
    }
  }
}
