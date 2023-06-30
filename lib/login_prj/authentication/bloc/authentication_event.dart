part of 'authentication_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

final class AuthEventStatusChanged extends AuthEvent {
  final AuthStatus status;

  AuthEventStatusChanged(this.status);
}

final class AuthEventLogoutRequested extends AuthEvent {
  AuthEventLogoutRequested();
}
