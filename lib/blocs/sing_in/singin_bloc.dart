import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'singin_event.dart';
part 'singin_state.dart';

class SinginBloc extends Bloc<SinginEvent, SinginState> {
  final String singinPage;

  SinginBloc({required this.singinPage})
      : super(SinginPageState(page: singinPage)) {
    on<SinginPageEvent>(_onPageChanged);
  }

  void _onPageChanged(SinginPageEvent event, Emitter<SinginState> emit) {
    emit(SinginPageState(page: event.page));

    print('_onPageChanged ::: event ::: $event');
    print('_onPageChanged ::: event.page ::: ${event.page}');
  }
}
