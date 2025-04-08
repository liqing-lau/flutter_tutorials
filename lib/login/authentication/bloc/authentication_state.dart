/*
Output of AuthBloc and consumed by UI layer
*/

part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown, 
    this.user = User.empty,
  });
  
  // default state
  const AuthenticationState.unknown() : this._();

  // when the user is authenticated
  const AuthenticationState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  // when the user is unauthenticated
  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];
}