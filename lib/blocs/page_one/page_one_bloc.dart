import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'page_one_event.dart';
part 'page_one_state.dart';

class PageOneBloc extends Bloc<PageOneEvent, PageOneState> {
  PageOneBloc() : super(const PageOneState()) {
    on<NavigateToPageOneEvent>(_onNavigateToPageOneEvent);
  }

  void _onNavigateToPageOneEvent(
      NavigateToPageOneEvent event, Emitter<PageOneState> emit) {
    final state = this.state;
    print('PageOneBloc:::_onNavigateToPageOneEvent:::> state: $state');
    emit(PageOneState());
  }

  @override
  Stream<PageOneState> mapEventToState(PageOneEvent event) async* {
    if (event is NavigateToPageOneEvent) {
      print('NavigateToPageOneEvent:::mapEventToState:::> state: $state');

      yield PageOneState();
    }
  }
}
