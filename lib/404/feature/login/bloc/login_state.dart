part of 'login_bloc.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final LoginModel? loginModel;
  LoginState({this.isLoading = false, this.loginModel});

  LoginState copyWith({
    bool? isLoading,
    LoginModel? loginModel,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      loginModel: loginModel ?? this.loginModel,
    );
  }

  @override
  List<Object?> get props => [isLoading, loginModel];
}
