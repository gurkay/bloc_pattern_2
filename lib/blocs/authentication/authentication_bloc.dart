import 'dart:async';

import 'package:equatable/equatable.dart';

import '../bloc_exports.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;
  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;

  AuthenticationBloc({
    required this.authenticationRepository,
    required this.userRepository,
  }) : super(AuthenticationUnknowState()) {
    on<_AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
  }

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    return super.close();
  }

  Future<void> _onAuthenticationStatusChanged(
    _AuthenticationStatusChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return emit(const AuthenticationUnauthenticatedState());

      case AuthenticationStatus.authenticated:
        final user = await _tryGetUser();
        return emit(
          user != null
              ? AuthenticationAuthenticatedState(user)
              : AuthenticationUnauthenticatedState(),
        );
      case AuthenticationStatus.unknown:
        return emit(
          AuthenticationUnauthenticatedState(),
        );
    }
  }

  void _onAuthenticationLogoutRequested(
    AuthenticationLogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) {
    authenticationRepository.logOut();
  }

  Future<User?> _tryGetUser() async {
    try {
      final user = await userRepository.getUser();
      return user;
    } catch (_) {
      return null;
    }
  }
}
