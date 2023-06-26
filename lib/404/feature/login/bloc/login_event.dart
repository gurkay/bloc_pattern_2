part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class LoginEventIsLoading extends LoginEvent {
  final bool isLoading;

  LoginEventIsLoading({required this.isLoading});
}

class LoginEventIsSecurePassword extends LoginEvent {
  final bool isSecurePassword;

  LoginEventIsSecurePassword({required this.isSecurePassword});
}

class LoginEventSubmitButton extends LoginEvent {
  final LoginModel loginModel;

  LoginEventSubmitButton({required this.loginModel});
}
