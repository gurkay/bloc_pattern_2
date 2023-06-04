import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomePageState()) {
    on<PageChanged>(_onPageChanged);
  }

  void _onPageChanged(
    PageChanged event,
    Emitter<HomeState> emit,
  ) {
    emit(state);
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomePageEvent) {
      yield HomePageState();
    } else if (event is HomeDetailPageEvent) {
      yield HomeDetailPageState();
    } else if (event is TimerViewEvent) {
      yield TimerViewState();
    }
  }
}
