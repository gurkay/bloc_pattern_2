import 'dart:async';

import 'package:bloc_pattern_2/404/feature/login/service/login_service.dart';
import 'package:bloc_pattern_2/404/product/model/token_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/login_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ILoginService _iLoginService;
  LoginBloc(ILoginService iLoginService)
      : _iLoginService = iLoginService,
        super(LoginState()) {
    on<LoginEventIsLoading>(_onIsLoading);
    on<LoginEventIsSecurePassword>(_onIsSecurePassword);
    on<LoginEventSubmitButton>(_onIsSubmitButton);
  }

  Future<void> checkUser(String email, String password) async {
    emit(state.copyWith(
      isLoading: true,
      loginModel: LoginModel(email, password),
    ));

    await Future.delayed(const Duration(seconds: 2));

    final response = await _iLoginService.login(state.loginModel!);

    if (response != null) {
      emit(state.copyWith(isCompleted: true));
    }
    emit(state.copyWith(isLoading: false));
  }

  Future<void> isSecurePassword(bool isSecure) async {
    emit(state.copyWith(isSecurePassword: isSecure));
  }

  Future<void> _onIsLoading(
    LoginEventIsLoading event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginStateIsLoading(isLoading: event.isLoading));
    await Future.delayed(const Duration(seconds: 2));
    emit(LoginStateIsLoading(isLoading: !event.isLoading));
  }

  Future<void> _onIsSubmitButton(
    LoginEventSubmitButton event,
    Emitter<LoginState> emit,
  ) async {
    final response = await _iLoginService.login(event.loginModel);
    if (response != null) {
      emit(
        LoginStateSubmitButton(isCompleted: !state.isCompleted),
      );
    }
  }

  void _onIsSecurePassword(
    LoginEventIsSecurePassword event,
    Emitter<LoginState> emit,
  ) {
    emit(LoginStateIsSecurePassword(isSecurePassword: event.isSecurePassword));
  }
}
