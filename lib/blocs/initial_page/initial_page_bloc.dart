import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'initial_page_event.dart';
part 'initial_page_state.dart';

class InitialPageBloc extends Bloc<InitialPageEvent, InitialPageState> {
  InitialPageBloc() : super(FirstInitialPageState()) {
    on<FirstInitialPageEvent>(_onPageChanged);
  }

  void _onPageChanged(
      FirstInitialPageEvent event, Emitter<InitialPageState> emit) {
    emit(FirstInitialPageState());

    print('_onPageChanged ::: event ::: $event');
    print('_onPageChanged ::: event.page ::: ');
  }
}
