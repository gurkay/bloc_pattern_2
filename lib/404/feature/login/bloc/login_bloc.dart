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
    on<LoginEventIsLoadingShow>(_onIsLoadingShow);
    on<LoginEventIsLoadingHidden>(_onIsLoadingHidden);
    on<LoginEventIsSecurePasswordShow>(_onIsSecurePasswordShow);
    on<LoginEventIsSecurePasswordHidden>(_onIsSecurePasswordHidden);
  }

  Future<void> checkUser(String email, String password) async {
    emit(state.copyWith(
      isLoading: true,
      loginModel: LoginModel(email, password),
    ));

    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(isLoading: false));

    final response = await _iLoginService.login(state.loginModel!);

    if (response != null) {
      emit(state.copyWith(isCompleted: true));
    }
  }

  Future<void> isSecurePassword(bool isSecure) async {
    emit(state.copyWith(isSecurePassword: isSecure));
  }

  void _onIsLoadingShow(
      LoginEventIsLoadingShow event, Emitter<LoginState> emit) {
    emit(LoginStateIsLoadingShow(isLoading: event.isLoading));
  }

  void _onIsLoadingHidden(
      LoginEventIsLoadingHidden event, Emitter<LoginState> emit) {
    emit(LoginStateIsLoadingHidden(isLoading: event.isLoading));
  }

  void _onIsSecurePasswordShow(
      LoginEventIsSecurePasswordShow event, Emitter<LoginState> emit) {
    emit(LoginStateIsSecurePasswordShow(
        isSecurePassword: event.isSecurePassword));
  }

  void _onIsSecurePasswordHidden(
      LoginEventIsSecurePasswordHidden event, Emitter<LoginState> emit) {
    emit(LoginStateIsSecurePasswordHidden(
        isSecurePassword: event.isSecurePassword));
  }
}
