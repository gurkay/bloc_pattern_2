import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'singin_event.dart';
part 'singin_state.dart';

class SinginBloc extends Bloc<SinginEvent, SinginState> {
  final String singinPage;
  static const routeName = '/sing_in';
  SinginBloc({required this.singinPage})
      : super(const SinginPageState(page: routeName)) {
    on<SinginPageEvent>(_onPageChanged);
  }

  void _onPageChanged(SinginPageEvent event, Emitter<SinginState> emit) {
    emit(SinginPageState(page: event.page));
    print(event);
  }
}
