import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/login_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState());

  Future<void> checkUser(String email, String password) async {
    emit(state.copyWith(
        isLoading: true, loginModel: LoginModel(email, password)));
    print('login_bloc ::: checkUser ::: before 2 second');
    await Future.delayed(const Duration(seconds: 2));
    print(
        'login_bloc ::: checkUser ::: after 2 second ::: email: $email, password: $password');
    emit(state.copyWith(isLoading: false));
  }

  Future<void> isSecurePassword(bool isSecure) async {
    emit(state.copyWith(isSecurePassword: isSecure));
  }
}
