import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

/* 
depends on AuthRepo and UserRepo

when an instance of AuthenticationBloc is created, it gets initialized 
with these two repositories, and they will be used throughout the bloc's 
lifecycle to manage authentication and user data.

*/
class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
    required UserRepository userRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        // initial state is unknown
        super(const AuthenticationState.unknown()) {
    // listens for auth status stream
    on<AuthenticationSubscriptionRequested>(_onSubscriptionRequested);
    // listen for logout req
    on<AuthenticationLogoutPressed>(_onLogoutPressed);
  }

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;

  Future<void> _onSubscriptionRequested(
    AuthenticationSubscriptionRequested event,
    Emitter<AuthenticationState> emit,
  ) {
    //  sub to stream of AuthRepo and emits a state 
    return emit.onEach(
      _authenticationRepository.status,
      onData: (status) async {
        switch (status) {

          case AuthenticationStatus.unauthenticated:
            return emit(const AuthenticationState.unauthenticated());

          case AuthenticationStatus.authenticated:
            final user = await _tryGetUser();
            return emit(
              user != null
                  ? AuthenticationState.authenticated(user)
                  : const AuthenticationState.unauthenticated(),
            );
            
          case AuthenticationStatus.unknown:
            return emit(const AuthenticationState.unknown());
        }
      },
      onError: addError,
    );
  }

  void _onLogoutPressed(
    AuthenticationLogoutPressed event,
    Emitter<AuthenticationState> emit,
  ) {
    _authenticationRepository.logOut();
  }

  Future<User?> _tryGetUser() async {
    try {
      final user = await _userRepository.getUser();
      return user;
    } catch (_) {
      return null;
    }
  }
}