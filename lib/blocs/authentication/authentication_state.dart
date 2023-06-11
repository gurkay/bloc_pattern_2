part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final User user;
  const AuthenticationState(
    this.status,
    this.user,
  );

  @override
  List<Object?> get props => [
        status,
        user,
      ];
}

class AuthenticationUnauthenticatedState extends AuthenticationState {
  const AuthenticationUnauthenticatedState()
      : super(AuthenticationStatus.unauthenticated, User.empty);
}

class AuthenticationAuthenticatedState extends AuthenticationState {
  final User user;
  const AuthenticationAuthenticatedState(this.user)
      : super(
          AuthenticationStatus.authenticated,
          user,
        );
}

class AuthenticationUnknowState extends AuthenticationState {
  const AuthenticationUnknowState()
      : super(AuthenticationStatus.unknown, User.empty);
}
