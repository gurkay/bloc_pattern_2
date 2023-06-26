part of 'login_bloc.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final bool isSecurePassword;
  final LoginModel? loginModel;
  final TokenModel? tokenModel;
  final bool isCompleted;
  LoginState({
    this.isLoading = false,
    this.isSecurePassword = true,
    this.loginModel,
    this.tokenModel,
    this.isCompleted = false,
  });

  LoginState copyWith({
    bool? isLoading,
    bool? isSecurePassword,
    LoginModel? loginModel,
    TokenModel? tokenModel,
    bool? isCompleted,
  }) {
    return LoginState(
      isLoading: isLoading ?? false,
      isSecurePassword: isSecurePassword ?? true,
      loginModel: loginModel ?? this.loginModel,
      tokenModel: tokenModel ?? this.tokenModel,
      isCompleted: isCompleted ?? false,
    );
  }

  @override
  List<Object?> get props =>
      [isLoading, isSecurePassword, loginModel, tokenModel, isCompleted];
}

class LoginStateIsLoading extends LoginState {
  LoginStateIsLoading({required super.isLoading});
}

class LoginStateIsSecurePassword extends LoginState {
  LoginStateIsSecurePassword({required super.isSecurePassword});
}

class LoginStateSubmitButton extends LoginState {
  LoginStateSubmitButton({
    required super.isCompleted,
  });
}
