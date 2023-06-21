part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({this.isLoading = false});

  final bool isLoading;

  @override
  List<Object> get props => [isLoading];
}
