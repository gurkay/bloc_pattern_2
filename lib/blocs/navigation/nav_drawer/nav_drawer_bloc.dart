import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'nav_drawer_event.dart';
part 'nav_drawer_state.dart';

enum NavItem {
  page_one,
  page_two,
  page_three,
  page_four,
  page_five,
  page_six,
}

class NavDrawerBloc extends Bloc<NavDrawerEvent, NavDrawerState> {
  NavDrawerBloc() : super(const NavDrawerState(NavItem.page_one)) {
    on<NavigateToEvent>(_onNavigateToEvent);
  }

  void _onNavigateToEvent(NavigateToEvent event, Emitter<NavDrawerState> emit) {
    final state = this.state;
    print('NavDrawerBloc:::_onNavigateToEvent:::> state: $state');
    emit(NavDrawerState(event.destination));
  }

  @override
  Stream<NavDrawerState> mapEventToState(NavDrawerEvent event) async* {
    if (event is NavigateToEvent) {
      print('NavDrawerBloc:::mapEventToState:::> state: $state');
      if (event.destination != state.selectedItem) {
        yield NavDrawerState(event.destination);
      }
    }
  }
}
