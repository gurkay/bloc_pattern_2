part of 'login_bloc.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final bool isSecurePassword;
  final LoginModel? loginModel;
  LoginState(
      {this.isLoading = false, this.isSecurePassword = false, this.loginModel});

  LoginState copyWith({
    bool? isLoading,
    bool? isSecurePassword,
    LoginModel? loginModel,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isSecurePassword: isSecurePassword ?? this.isSecurePassword,
      loginModel: loginModel ?? this.loginModel,
    );
  }

  @override
  List<Object?> get props => [isLoading, isSecurePassword, loginModel];
}
