import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState());

  Future<void> checkUser(String email, String password) async {
    print('login_bloc ::: checkUser ::: before 2 second');
    await Future.delayed(const Duration(seconds: 2));
    print('login_bloc ::: checkUser ::: after 2 second');
    print('email: $email, password: $password');
  }
}
