part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();
}

class LoginEventIsLoadingShow extends LoginEvent {
  final bool isLoading;

  LoginEventIsLoadingShow({required this.isLoading});
}

class LoginEventIsLoadingHidden extends LoginEvent {
  final bool isLoading;

  LoginEventIsLoadingHidden({required this.isLoading});
}

class LoginEventIsSecurePasswordShow extends LoginEvent {
  final bool isSecurePassword;

  LoginEventIsSecurePasswordShow({required this.isSecurePassword});
}

class LoginEventIsSecurePasswordHidden extends LoginEvent {
  final bool isSecurePassword;

  LoginEventIsSecurePasswordHidden({required this.isSecurePassword});
}
