part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  final bool isLoading;
  final bool isSecurePassword;
  final LoginModel? loginModel;
  final TokenModel? tokenModel;
  final bool isCompleted;
  const LoginState({
    this.isLoading = false,
    this.isSecurePassword = true,
    this.loginModel,
    this.tokenModel,
    this.isCompleted = false,
  });

  @override
  List<Object?> get props =>
      [isLoading, isSecurePassword, loginModel, tokenModel, isCompleted];
}

final class LoginStateInitial extends LoginState {}

final class LoginStateIsLoading extends LoginState {
  const LoginStateIsLoading({required super.isLoading});

  @override
  String toString() => 'LoginStateIsLoading';
}

final class LoginStateIsSecurePassword extends LoginState {
  const LoginStateIsSecurePassword({required super.isSecurePassword});

  @override
  String toString() => 'LoginStateIsSecurePassword';
}

final class LoginStateSubmitButton extends LoginState {
  const LoginStateSubmitButton({
    required super.isCompleted,
  });

  @override
  String toString() => 'LoginStateSubmitButton';
}
