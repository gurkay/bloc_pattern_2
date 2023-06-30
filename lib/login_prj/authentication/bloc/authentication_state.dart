part of 'authentication_bloc.dart';

abstract class AuthState extends Equatable {
  final AuthStatus status;
  final User user;

  const AuthState(this.status, this.user);

  @override
  List<Object> get props => [status, user];
}

class AuthStateUnknown extends AuthState {
  const AuthStateUnknown() : super(AuthStatus.unknown, User.empty);
}

class AuthStateAuthenticated extends AuthState {
  final User user;
  const AuthStateAuthenticated({required this.user})
      : super(AuthStatus.authenticated, user);
}

class AuthStateUnuthenticated extends AuthState {
  const AuthStateUnuthenticated()
      : super(AuthStatus.unauthenticated, User.empty);
}
