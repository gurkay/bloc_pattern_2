import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'page_two_event.dart';
part 'page_two_state.dart';

class PageTwoBloc extends Bloc<PageTwoEvent, PageTwoState> {
  PageTwoBloc() : super(const PageTwoState()) {
    on<NavigateToPageTwoEvent>(_onNavigateToPageTwoEvent);
  }

  void _onNavigateToPageTwoEvent(
      NavigateToPageTwoEvent event, Emitter<PageTwoState> emit) {
    final state = this.state;
    print('PagetwoBloc:::_onNavigateToPagetwoEvent:::> state: $state');
    emit(PageTwoState());
  }

  @override
  Stream<PageTwoState> mapEventToState(PageTwoEvent event) async* {
    if (event is NavigateToPageTwoEvent) {
      print('NavigateToPageTwoEvent:::mapEventToState:::> state: $state');

      yield PageTwoState();
    }
  }
}
