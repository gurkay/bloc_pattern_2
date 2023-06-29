part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

final class LoginEventIsLoading extends LoginEvent {
  final bool isLoading;

  LoginEventIsLoading({required this.isLoading});
}

final class LoginEventIsSecurePassword extends LoginEvent {
  final bool isSecurePassword;

  LoginEventIsSecurePassword({required this.isSecurePassword});
}

final class LoginEventSubmitButton extends LoginEvent {
  final LoginModel loginModel;

  LoginEventSubmitButton({required this.loginModel});
}
